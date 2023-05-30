<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PaymentMethodController;

//pagos
Route::get('/paymentmethods', [PaymentMethodController::class, 'index'])
    ->name('paymentmethod.index');

Route::post('/paymentmethod/store', [PaymentMethodController::class, 'createPaymentMethod'])
    ->name('paymentmethod.store');

Route::get('/paymentmethod/show/{paymentmethod:id}', [PaymentMethodController::class, 'showPaymentMethod'])
    ->name('paymentmethod.show');

Route::put('/paymentmethod/update/{id}', [PaymentMethodController::class, 'update'])
    ->name('paymentmethod.update');

Route::delete('/paymentmethod/destroy/{payment:id}', [PaymentMethodController::class, 'destroyPaymentMethod'])
    ->name('paymentmethod.destroy');
