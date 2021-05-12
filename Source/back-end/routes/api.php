<?php

use App\Http\Controllers\AuthorController;

use App\Http\Controllers\BookController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\PublisherController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HomeController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::prefix('admin')->group(function () {
    Route::post('/login', [UserController::class, 'login']);
    Route::group(['middleware' => ['jwt.verify']], function () {
        Route::get('/user', [UserController::class, 'getUser']);
        Route::post('/logout', [UserController::class, 'logout']);

        Route::prefix('category')->group(function () {
            Route::get('list',[CategoryController::class, 'getAll']);
            Route::get('count',[CategoryController::class, 'countCategories']);
            Route::post('store',[CategoryController::class, 'store']);
            Route::get('/{id}',[CategoryController::class, 'findById']);
            Route::put('/{id}/update',[CategoryController::class, 'update']);
            Route::delete('/{id}/delete',[CategoryController::class, 'delete']);
            Route::post('/search',[CategoryController::class, 'search']);
        });

        Route::prefix('book')->group(function () {
            Route::get('list',[BookController::class, 'getAll']);
            Route::get('list-ten',[BookController::class, 'getTenbook']);
            Route::get('count',[BookController::class, 'countBooks']);
            Route::post('store',[BookController::class, 'store']);
            Route::get('/{id}/show-detail/',[BookController::class, 'showDetail']);
            Route::get('/{id}/author-id',[BookController::class, 'findByAuthorId']);
            Route::get('/{id}/category-id',[BookController::class, 'findByCategoryId']);
            Route::post('/{id}/update',[BookController::class, 'update']);
            Route::delete('/{id}/delete',[BookController::class, 'delete']);
            Route::post('/search',[BookController::class, 'searchBooks']);
        });

        Route::prefix('author')->group(function () {
            Route::get('list',[AuthorController::class, 'getAll']);
            Route::get('count',[AuthorController::class, 'countAuthors']);
            Route::get('list-ten',[AuthorController::class, 'getTenAuthor']);
            Route::post('store',[AuthorController::class, 'store']);
            Route::get('/{id}',[AuthorController::class, 'findById']);
            Route::post('/{id}/update',[AuthorController::class, 'update']);
            Route::delete('/{id}/delete',[AuthorController::class, 'delete']);
            Route::post('/search',[AuthorController::class, 'search']);

        });

        Route::prefix('publisher')->group(function () {
            Route::get('list',[PublisherController::class, 'getAll']);
        });
    });
});


Route::prefix('home')->group(function () {
    Route::post('/book-topic', [HomeController::class, 'getTopicBooks']);
    Route::get('/book-news', [HomeController::class, 'getTenNewBooks']);
    Route::get('/book-all', [HomeController::class, 'index']);
    Route::get('/author-all', [HomeController::class, 'getAllAuthors']);
    Route::get('/category-all', [HomeController::class, 'getAllCategories']);
    Route::post('/search', [HomeController::class, 'search']);
    Route::get('/{id}/author-id',[HomeController::class, 'findByAuthorId']);
    Route::get('/{id}/category-id',[HomeController::class, 'findCategoryById']);
    Route::get('/{id}/show-detail',[HomeController::class, 'showDetail']);
    Route::get('/{id}/auhor-detail',[HomeController::class, 'findAuthorById']);


});

//Route::prefix('cart')->group(function() {
//    Route::get('list', [CartController::class, 'showCart']);
//    Route::get('{id}/add', [CartController::class, 'addToCart']);
//    Route::get('{id}/remove', [CartController::class, 'removeBook']);
//    Route::post('update', [CartController::class, 'updateCart']);
//    Route::delete('delete', [CartController::class, 'deleteCart']);
//});

Route::post('login', [UserController::class, 'login']);
Route::post('register', [UserController::class, 'register']);
Route::prefix('customer')->group(function() {
    Route::group(['middleware' => ['jwt.customer']], function () {
            Route::get('{id}/cart-list', [CartController::class, 'showCart']);
            Route::get('{id}/cart-info', [CartController::class, 'cartInfo']);
            Route::post('cart-add', [CartController::class, 'addToCart']);
            Route::post('cart-update', [CartController::class, 'updateItemQuantity']);
            Route::post('cart-remove-item', [CartController::class, 'removeItem']);
            Route::get('{id}/cart-delete', [CartController::class, 'deleteCart']);
    });
});

