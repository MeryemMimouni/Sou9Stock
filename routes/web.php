<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ServiceController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

/* Route::get('/', function () {
    return view('welcome');
});
 */



Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});
/* <--------- les page principale ---------> */
Route::get('/service', function () {
    return view('principal.service');
});
/* Route::get('/jumia', function () {
    return view('principal.accuiel');
}); */
/* <--------- panier ---------> */
Route::get('/panier', function () {
    return view('principal.panier');
});


/* <--------- panier ---------> */
Route::get('/cart', function () {
    return view('principal.cart');
});


Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/principal/service', [HomeController::class, 'servicePage'])->name('principale.service');
// catégorie
Route::get('/category/{category}', [HomeController::class, 'getProductByCategoy'])->name('category.products');

Route::resource('products', ProductController::class);
Route::get('/admin/products', [ProductController::class, 'index'])->name('admin.products.index');



//route cart
Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
Route::post('/add/cart/{product}', [CartController::class, 'addPoductToCart'])->name('add.cart');
Route::put('/update/{product}/cart', [CartController::class, 'updatePoductOnCart'])->name('update.cart');
Route::delete('/remove/{product}/cart', [CartController::class, 'removePoductFromCart'])->name('remove.cart');
//admin 
Route::get('/admin', [AdminController::class, 'index'])->name('admin.index');
Route::get('/admin/login', [AdminController::class, 'showAdminLoginForm'])->name('admin.login');
Route::post('/admin/login' , [AdminController::class, 'adminLogin'])->name('admin.login');
//Route::get('/admin/logout' , [AdminController::class ,'adminLogout'])->name('admin.logout');
Route::post('/admin/logout' , [AdminController::class ,'adminLogout'])->name('admin.logout');



//admin products
Route::get('/admin/produits' , [AdminController::class ,'getProducts'])->name('admin.products');
Route::get('/products/{slug}', [ProductController::class,'show'])->name('products.show');
Route::post('/upload-image', [AdminController::class ,'uploadImage'])->name('upload.image');
//admin orders
Route::get('/admin/commandes' , [AdminController::class ,'getOrders'])->name('admin.orders');
Route::resource('orders', OrderController::class);
Route::post('/confirm-order', [OrderController::class, 'confirmOrder'])->name('confirm.order');
Route::get('/search', [HomeController::class,'search'])->name('search');
Route::post('/confirm-order', [CartController::class,'confirmOrder'])->name('confirm.order');

