<?php

namespace App\Http\Controllers;
use Cart;

use Illuminate\Support\Facades\Http; 
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Order;
class CartController extends Controller
{

    public function confirmOrder(Request $request)
    {
        // Assurez-vous que l'utilisateur est authentifié
        if (!auth()->check()) {
            return redirect()->route('login')->with('error', 'Vous devez être connecté pour confirmer la commande.');
        }
    
        // Récupérez l'identifiant de l'utilisateur actuellement authentifié
        $userId = auth()->user()->id;
    
        // Récupérez les articles du panier
        $cartItems = \Cart::getContent();
    
        // Vérifiez si le panier n'est pas vide avant de confirmer la commande
        if ($cartItems->isEmpty()) {
            return redirect()->route('cart')->with('error', 'Votre panier est vide. Ajoutez des articles avant de confirmer la commande.');
        }
    
        // Calculez le total de la commande avant de vider le panier
        $totalOrder = \Cart::getTotal();
    
        // Créez un nouvel enregistrement dans la table "orders" pour chaque article
        foreach ($cartItems as $cartItem) {
            $order = new Order();
            $order->user_id = $userId;
            $order->product_name = $cartItem->name;
            $order->qty = $cartItem->quantity;
            $order->price = $cartItem->price;
            $order->total = $cartItem->getPriceSum();
            $order->paid = false;
            $order->delivered = false;
            $order->save();
        }
    
        // Vous pouvez également supprimer les articles du panier ici si nécessaire
        \Cart::clear();
    
        // Récupérez le nom de l'utilisateur
        $userName = auth()->user()->name;
    
        // Envoyez un message WhatsApp avec le nom de l'utilisateur et le total de la commande
        $message = "Bonjour, je suis intéressé(e) par les articles suivants : " . implode(', ', $cartItems->pluck('name')->toArray()) . ". J'aimerais passer commande pour un total de " . $totalOrder . " DH. Pourriez-vous me fournir davantage d'informations et me contacter sur WhatsApp pour finaliser la transaction ? Merci.";

        $whatsappNumber = "+212773982812"; // Remplacez par le numéro WhatsApp de votre entreprise
    
        // Utilisez l'API WhatsApp pour générer le lien WhatsApp
        $whatsappLink = "https://api.whatsapp.com/send?phone=" . $whatsappNumber . "&text=" . urlencode($message);
    
        // Redirigez l'utilisateur vers le lien WhatsApp
        return redirect()->away($whatsappLink)->with('success', 'Commande confirmée avec succès.');
    }
     
    //return cart items
    public function index(){
            return view('cart.index')->with([
                "items" =>\Cart::getContent()
            ]);
    }


  
     
    //add item to cart 
    public function addPoductToCart(Request $request,Product $product ){
        \Cart::add(array(
            "id" =>$product->id,
            "name" =>$product->title,
            "price" =>$product->price,
            "quantity" =>$request->qty,
            "atttributes" => array(),
            'associatedModel' => $product,
           
        )
        
        );
        return redirect()->route('cart.index');
    }
  
     //update item on cart 
     public function updatePoductOnCart(Request $request,Product $product ){
        \Cart::update($product->id, array(
            'quantity' => array(
                'relative' => false,
                'value' => $request->qty
            ),
          ));
        return redirect()->route('cart.index');
    }

      //remove item from cart 
      public function removePoductFromCart(Product $product ){
        \Cart::remove($product->id);
           
          return redirect()->route('cart.index');
    }
}
