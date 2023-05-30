<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CondicionController;

//currencies
Route::get('/condiciones', [CondicionController::class, 'index'])
    ->name('condicion.index');

Route::post('/condicion/store', [CondicionController::class, 'store'])
    ->name('condicion.store');
