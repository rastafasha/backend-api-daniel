<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;


Route::get('/profiles', [ProfileController::class, 'index'])
    ->name('profile.index');

Route::post('/profile/store', [ProfileController::class, 'profileStore'])
    ->name('profile.store');

Route::get('/profile/show/{profile:user_id}', [ProfileController::class, 'profileShow'])
    ->name('profile.show');

Route::put('/profile/update/{profile}', [ProfileController::class, 'profileUpdate'])
    ->name('profile.update');

Route::delete('/profile/destroy/{profile:id}', [ProfileController::class, 'destroy'])
    ->name('profile.destroy');


Route::put('/profile/update/status/{profile:id}', [ProfileController::class, 'postUpdateStatus'])
    ->name('profile.status');

Route::post('/profile/upload', [ProfileController::class, 'upload'])
    ->name('profile.upload');

Route::delete('/profile/delete-foto/{id}', [ProfileController::class, 'deleteFotoProfile'])
    ->name('profile.deleteFotoProfile');
