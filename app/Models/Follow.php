<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Follow extends Model
{
    use HasFactory;

    /*
    |--------------------------------------------------------------------------
    | goblan variables
    |--------------------------------------------------------------------------
    */
    protected $fillable = [

        'profile_id',
        'category_id',
        'favorite_id',
    ];

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */
    public function users()
    {
        return $this->hasMany(Profile::class, 'favorite_id');
    }
    public function categories()
    {
        return $this->hasMany(Category::class, 'category_id');
    }

    public function profiles()
    {
        return $this->hasMany(Profile::class, 'profile_id');
    }
}
