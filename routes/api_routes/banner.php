<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BannerController;


Route::get('/banners', [BannerController::class, 'index'])
    ->name('banner.index');

Route::post('/banner/store', [BannerController::class, 'bannerStore'])
    ->name('banner.store');

Route::get('/banner/show/{banner}', [BannerController::class, 'bannerShow'])
    ->name('banner.show');


Route::put('/banner/update/{banner}', [BannerController::class, 'bannerUpdate'])
    ->name('banner.update');

Route::delete('/banner/destroy/{banner}', [BannerController::class, 'destroy'])
    ->name('banner.destroy');

Route::put('/banner/update/status/{banner:id}', [BannerController::class, 'bannerUpdateStatus'])
    ->name('banner.status');

Route::post('/banner/upload', [BannerController::class, 'upload'])
    ->name('banner.upload');

Route::delete('/banner/delete-foto/{id}', [BannerController::class, 'deleteFotoBanner'])
    ->name('banner.deleteFotoBanner');
