<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Http\Requests\StoreCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function showProducts($slug)
    {
      

        
            $products = $category->products()->paginate(10);
            return view('category.products')->with([
                "products" => $products,
                "categories" => Category::has("products")->get(),
            ]);
    }
    public function editVisibility(Category $category)
{
    return view('admin.categories.edit', compact('category'));
}

public function updateVisibility(Request $request, Category $category)
{
    $request->validate([
        'visible' => 'boolean', // Assurez-vous que la valeur est un booléen
    ]);

    $category->update([
        'visible' => $request->has('visible'), // Mettez à jour le champ "visible" en fonction de la case à cocher
    ]);

    return redirect()->route('admin.categories.index')->with('success', 'Visibilité de la catégorie mise à jour avec succès.');
}


    public function index()
    {
        //
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
    public function store(StoreCategoryRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Category $category)
    {
   
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Category $category)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCategoryRequest $request, Category $category)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Category $category)
    {
        //
    }
}
