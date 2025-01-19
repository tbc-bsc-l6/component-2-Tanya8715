<?php

use App\Http\Controllers\AboutUsController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ColorController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\FilterProductController;
use App\Http\Controllers\FilterTagController;
use App\Http\Controllers\FooterMenuController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\PopUpController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SaleProductController;
use App\Http\Controllers\TagController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Authentication Routes
Route::match(['get', 'post'], '/', [AuthController::class, 'login'])->name('login');
Route::post('/register', [AuthController::class, 'register'])->name('register'); // Ensure this route uses POST only
Route::get('register', [AuthController::class, 'register'])->name('register');


// Protected Routes (requires authentication)
    Route::group(['middleware' => 'auth'], function () {
    Route::get('/dashboard', [PageController::class, 'dashboard'])->name('dashboard');
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

    // Product Management Routes
    Route::get('/product', [ProductController::class, 'index'])->name('product');
    Route::get('/product/create', [ProductController::class, 'create'])->name('create.product');
    Route::get('/product/edit/{product}', [ProductController::class, 'edit'])->name('edit.product');
    Route::post('/product/store', [ProductController::class, 'store'])->name('store.product');
    Route::post('/product/update/{product}', [ProductController::class, 'update'])->name('update.product');
    Route::get('/product/delete/{product}', [ProductController::class, 'destroy'])->name('delete.product');

    // Other Routes
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile');
    Route::post('/profile/update', [ProfileController::class, 'update'])->name('update.profile');
    Route::get('/settings', [SettingController::class, 'index'])->name('settings');

    // User Management
    Route::get('/users', [UserController::class, 'index'])->name('users');
    Route::get('/user/create', [UserController::class, 'create'])->name('create.user');
    Route::post('/user/store', [UserController::class, 'store'])->name('store.user');
    Route::get('/user/edit/{user}', [UserController::class, 'edit'])->name('edit.user');
    Route::post('/user/update/{user}', [UserController::class, 'update'])->name('update.user');
    Route::post('/user/delete/{user}', [UserController::class, 'destroy'])->name('delete.user');
});

// Public Routes (No authentication required)
Route::get('/about-us', [AboutUsController::class, 'index'])->name('about-us');
Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::post('/contact/store', [ContactController::class, 'store'])->name('store.contact');


Route::post('/contact', [ContactController::class, 'sendEmail'])->name('contact.send');
Route::get('/contact-success', function () {
    return view('contact-success');
})->name('contact.success');
