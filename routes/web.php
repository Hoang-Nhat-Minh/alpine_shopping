<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\BaseController;
use App\Http\Controllers\DiscountController;
use Illuminate\Http\Request;

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

Route::get('/', [BaseController::class, 'shop'])->name('shop.view');

Route::get('/cart', [BaseController::class, 'cart'])->name('cart');

Route::post('/cart', [DiscountController::class, 'checkCode'])->name('check.coupon');

Route::post('/checkout', [BaseController::class, 'checkout'])->name('checkout');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
