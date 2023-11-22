<?php

namespace App\Models;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = ['product_name', 'qty', 'price', 'total', 'paid', 'delivered'];


    
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    

    public function updateStock()
    {
        // Vérifier si la commande n'a pas déjà été livrée
        if ($this->delivered) {
            return;
        }
    
        // Marquer la commande comme livrée
        $this->delivered = 1;
        $this->save();
    
        // Mettre à jour la quantité en stock du produit correspondant
        $product = Product::where('title', $this->product_name)->first();
        
        if ($product) {
            // Vérifier si la quantité en stock est suffisante
            if ($product->inStock >= $this->qty) {
                // Décrémenter la quantité en stock
                $product->inStock -= $this->qty;
                $product->save();
            }
        }
    }

}
