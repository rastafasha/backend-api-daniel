<?php

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Auth\ChangeForgotPasswordControllerController;
use App\Http\Controllers\ContactFormController;
use App\Http\Controllers\Admin\AdminPlanController;
use App\Http\Controllers\Auth\PasswordResetController;
use App\Http\Controllers\Admin\AdminCurrencyController;
use App\Http\Controllers\Auth\ChangePasswordController;
//nuevos
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\FollowController;
use App\Http\Controllers\PaymentMethodController;
use App\Http\Controllers\BannerController;

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

// Route::post('register', [AuthController::class, 'register'])
//     ->name('register');

// Route::post('login', [AuthController::class, 'login'])
//     ->name('login');



Route::group(['middleware' => 'api'], function ($router) {

    // Auth
    require __DIR__ . '/api_routes/auth.php';

    // Contacts
    require __DIR__ . '/api_routes/contact.php';

    // Currency
    require __DIR__ . '/api_routes/currency.php';

    // Member
    require __DIR__ . '/api_routes/member.php';

    // Pagos
    require __DIR__ . '/api_routes/payment.php';

    // Plans
    require __DIR__ . '/api_routes/plans.php';

    // Category
    require __DIR__ . '/api_routes/category.php';

    // Profile
    require __DIR__ . '/api_routes/profile.php';

    // blog
    require __DIR__ . '/api_routes/post.php';

    // Payment Method
    require __DIR__ . '/api_routes/payment_method.php';

    // Follow
    require __DIR__ . '/api_routes/follow.php';

    // banner
    require __DIR__ . '/api_routes/banner.php';

    // users
    require __DIR__ . '/api_routes/users.php';

    // condiciones
    require __DIR__ . '/api_routes/condiciones.php';



 Route::post('/forgot-password', [ForgotPasswordController::class, 'forgotPassword'])
        ->name('forgot.password');

    Route::post('/change-forgot-password', [ChangeForgotPasswordControllerController::class, 'changeForgotPassword'])
        ->name('change.forgot.password');


    Route::post('/reset-password', [PasswordResetController::class, 'resetPassword'])
        ->name('reset.password');

    Route::post('/change-password', [ChangePasswordController::class, 'changePassword'])
        ->name('change.password');

    Route::post('/contact/form', [ContactFormController::class, 'contactStore'])
        ->name('contact.store');

    Route::get('/cache', function () {
        Artisan::call('cache:clear');
        return "Cache";
    });

    Route::get('/optimize', function () {
        Artisan::call('optimize:clear');
        return "Optimización de Laravel";
    });

    Route::get('/storage-link', function () {
        Artisan::call('storage:link');
        return "Storage Link";
    });


    Route::get('/migrate-seed', function () {
        Artisan::call('migrate:refresh --seed');
        return "Migrate seed";
    });

    Route::post('file', [imageController::class, 'file'])->name('fileUpload');
    Route::post('file/class/uploader', [imageController::class, 'fileClassUploader'])->name('fileUploaderClass');

    //rutas libres
    Route::get('/currencies', [AdminCurrencyController::class, 'index'])
        ->name('plan.index');

    Route::post('/currency/store', [AdminCurrencyController::class, 'currencyStore'])
        ->name('currency.store');

    Route::post('/plan/store', [AdminPlanController::class, 'planStore'])
        ->name('plan.store');

    Route::get('/categories', [CategoryController::class, 'index'])
        ->name('category.index');

    Route::get('/follows', [FollowController::class, 'index'])
        ->name('follow.index');

    Route::get('/paymentmethods', [PaymentMethodController::class, 'index'])
        ->name('paymentmethod.index');

    Route::get('/posts', [PostController::class, 'index'])
        ->name('post.index');

    Route::get('/banners', [BannerController::class, 'index'])
        ->name('banner.index');


});
