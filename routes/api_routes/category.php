<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;

//currencies
Route::get('/categories', [CategoryController::class, 'index'])
    ->name('category.index');

Route::post('/category/store', [CategoryController::class, 'categoryStore'])
    ->name('category.store');

Route::get('/category/show/{category}', [CategoryController::class, 'categoryShow'])
    ->name('category.show');

Route::put('/category/update/{category:id}', [CategoryController::class, 'categoryUpdate'])
    ->name('category.update');

Route::delete('/category/destroy/{category}', [CategoryController::class, 'categoryDestroy'])
    ->name('category.destroy');
