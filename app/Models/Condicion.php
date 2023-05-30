<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Condicion extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        'aceptaCondiciones',
    ];

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function users(){
        return $this->belongsTo(User::class, 'id');
    }
}
