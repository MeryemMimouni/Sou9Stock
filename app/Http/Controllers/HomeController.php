<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function search(Request $request)
{
    $query = $request->input('query');

    // Recherchez la catégorie par son titre
    $category = Category::where('title', $query)->first();

    // Si la catégorie est trouvée, redirigez l'utilisateur vers la page de cette catégorie
    if ($category) {
        return redirect()->route('category.products', $category->slug);
    }

    // Recherchez un produit par son titre
    $product = Product::where('title', 'like', "%$query%")->first();

    // Si un produit est trouvé, redirigez l'utilisateur vers la page du produit
    if ($product) {
        return redirect()->route('products.show', $product->slug);
    }

    // Si ni un produit ni une catégorie n'est trouvée, affichez un message d'erreur ou effectuez une action appropriée
    return view('not-found'); // Créez une vue pour gérer les éléments non trouvés
}


public function servicePage()
{
    $category = Category::where('slug', 'service')->first(); // Récupérez la catégorie "Service"

    if ($category) {
        $products = $category->products()->get();
    } else {
        $products = collect(); // Si la catégorie "Service" n'existe pas, initialisez une collection vide.
    }

    $categories = Category::with('products')->get(); // Ajoutez cette ligne pour obtenir toutes les catégories

    return view('principal.service', ['products' => $products, 'categories' => $categories]);
}
    public function index()
    {
        $categories = Category::with('products')->get();
    
        return view('principal.accuiel')->with([
            "products" => Product::latest()->paginate(10),
            "categories" => $categories,
        ] )
   ;
       
    }
    //show product py Category
    public function getProductByCategoy(Category $category)
    {
        $products = $category->products()->paginate(10);
        return view('category.products')->with([
            "products" => $products,
            "categories" => Category::has("products")->get(),
            "category" => $category, // Passer la variable $category à la vue
        ]); 
           
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::where('slug', $slug)->firstOrFail();
        $categories = Category::with('products')->get();
    
        return view('products.show', compact('product', 'categories'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
