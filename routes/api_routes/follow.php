<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FollowController;

//pagos
Route::get('/follows', [FollowController::class, 'index'])
    ->name('follow.index');

Route::post('/follow/store', [FollowController::class, 'createFollow'])
    ->name('follow.store');

Route::get('/follow/show/{paymentmethod:id}', [FollowController::class, 'showFollow'])
    ->name('follow.show');

Route::put('/follow/update/{id}', [FollowController::class, 'update'])
    ->name('follow.update');

Route::delete('/follow/destroy/{payment:id}', [FollowController::class, 'destroyPaymentMethod'])
    ->name('follow.destroy');
