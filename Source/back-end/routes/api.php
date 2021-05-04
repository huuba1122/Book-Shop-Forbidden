<?php

use App\Http\Controllers\AuthorController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\UserController;
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

        // jwt

Route::prefix('admin')->group(function () {
    Route::post('/login', [UserController::class, 'login']);
    Route::group(['middleware' => ['jwt.verify']], function () {
        Route::get('/user', [UserController::class, 'getUser']);
        Route::post('/logout', [UserController::class, 'logout']);

        Route::prefix('category')->group(function () {
            Route::get('list',[CategoryController::class, 'getAll']);
            Route::post('store',[CategoryController::class, 'store']);
            Route::get('/{id}',[CategoryController::class, 'findById']);
            Route::post('/{id}/update',[CategoryController::class, 'update']);
            Route::get('/{id}/delete',[CategoryController::class, 'delete']);
        });

        Route::prefix('book')->group(function () {
            Route::get('list',[BookController::class, 'getAll']);
            Route::post('store',[BookController::class, 'store']);
            Route::get('/{id}',[BookController::class, 'findById']);
            Route::put('/{id}/update',[BookController::class, 'update']);
            Route::delete('/{id}/delete',[BookController::class, 'delete']);
        });



        Route::prefix('author')->group(function () {
            Route::get('list',[AuthorController::class, 'getAll']);
            Route::post('store',[AuthorController::class, 'store']);
            Route::get('/{id}',[AuthorController::class, 'findById']);
            Route::put('/{id}/update',[AuthorController::class, 'update']);
            Route::delete('/{id}/delete',[AuthorController::class, 'delete']);
        });
    });
});
