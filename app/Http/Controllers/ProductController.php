<?php

namespace App\Http\Controllers;
use Illuminate\Support\Str;

use App\Models\Product;
use App\Models\Category;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware("auth:admin")->except([
            "index", "show"
        ]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return view('admin.products.index')->with([
            "products" => Product::latest()->paginate(10),
            "categories" => Category::has("products")->get(),

        ]);
       
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view("admin.products.create")->with([
            "categories" => Category::all()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validation des données du formulaire

        
        $this->validate($request, [
            "title" => "required|min:3",
            "description" => "required|min:5",
            "image" => "required|image|mimes:png,jpg,jpeg|max:2048",
            "price" => "required|numeric",
            "category_id" => "required|numeric",
            "flash_sale" => "nullable|boolean", // Ajoutez cette validation pour la case à cocher flash_sale
        ]);
      
        // Gérez le téléchargement de l'image
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $imageName = "images/products/" . time() . "_" . $file->getClientOriginalName();
            $file->move(public_path("images/products"), $imageName);
        }
    
        // Créez un nouveau produit avec les données du formulaire
        $product = new Product([
            "title" => $request->input('title'),
            "slug" => Str::slug($request->input('title')),
            "description" => $request->input('description'),
            "price" => $request->input('price'),
            "old_price" => $request->input('old_price'),
            "inStock" => $request->input('inStock'),
            "category_id" => $request->input('category_id'),
            "image" => $imageName, // Assurez-vous que $imageName contient le nom de l'image téléchargée
            "flash_sale" => $request->input('flash_sale', 0), // Utilisez la valeur de la case à cocher flash_sale
        ]);
    
        $product->save();
    
       
      
       
        return redirect()->route('admin.products.index')->withSuccess("Product added");

    }
    
    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
        return view("products.show")->with([
            "product" => $product
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
        return view("admin.products.edit")->with([
            "product" => $product,
            "categories" => Category::all()
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //validation
        $this->validate($request, [
            "title" => "required|min:3",
            "description" => "required|min:5",
            "image" => "image|mimes:png,jpg,jpeg|max:2048",
            "price" => "required|numeric",
            "category_id" => "required|numeric",
        ]);

        //update data
        if ($request->has("image")) {
            $image_path = public_path("images/products/" . $product->image);
            if (File::exists($image_path)) {
                unlink($image_path);
            }
            $file = $request->image;
            $imageName = "images/products/" . time() . "_" . $file->getClientOriginalName();
            $file->move(public_path("images/products"), $imageName);
            $product->image = $imageName;
        }
        $title = $request->title;
        $product->update([
            "title" => $title,
            "slug" => Str::slug($title),
            "description" => $request->description,
            "price" => $request->price,
            "old_price" => $request->old_price,
            "inStock" => $request->inStock,
            "category_id" => $request->category_id,
            "image" =>  $product->image,
        ]);
        return redirect()->route("admin.products")
            ->withSuccess("Product updated");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //delete data
        $image_path = public_path("images/products/" . $product->image);
        if (File::exists($image_path)) {
            unlink($image_path);
        }
        $product->delete();
        return redirect()->route("admin.products")
            ->withSuccess("Product deleted");
    }
}
