<?php

namespace App\Models;

use App\Jobs\PaymentRegisterJob;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Payment extends Model
{
    use HasFactory, SoftDeletes;

    /*
    |--------------------------------------------------------------------------
    | goblan variables
    |--------------------------------------------------------------------------
    */
    protected $fillable = [

        'referencia',
        'monto',
        'metodo_id',
        'currency_id',
        'user_id',
        'plan_id',
        'image',
        'status'
    ];

    const APPROVED = 'APPROVED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';

    /*
    |--------------------------------------------------------------------------
    | functions
    |--------------------------------------------------------------------------
    */

    protected static function boot(){

        parent::boot();

        static::created(function($user){

            PaymentRegisterJob::dispatch(
                $user
            )->onQueue("high");
        });

    }

    public static function statusTypes()
    {
        return [
            self::APPROVED, self::PENDING, self::REJECTED
        ];
    }

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */
    public function users()
    {
        return $this->belongsTo(User::class, 'id');
    }

    public function currencies()
    {
        return $this->hasMany(Currency::class, 'currency_id');
    }

    public function paymentmethods()
    {
        return $this->hasMany(PaymentMethod::class, 'metodo_id');
    }
}
