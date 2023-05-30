<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Profile extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        'nombre',
        'surname',
        'email',
        'direccion',
        'pais',
        'estado',
        'ciudad',
        'telhome',
        'telmovil',
        'facebook',
        'instagram',
        'twitter',
        'linkedin',
        'shortdescription',
        'emailPaypal',
        'nombrePaypal',
        'emailBinance',
        'userIdBinance',
        'image',
        'status',


    ];

    const VERIFIED = 'VERIFIED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';

    /*
    |--------------------------------------------------------------------------
    | functions
    |--------------------------------------------------------------------------
    */

    public function scopeForMember(Builder $builder)
    {
        return $builder
            ->where("user_id", auth()->id())
            ->get();
    }

    public function scopeForPublic(Builder $builder)
    {
        $builder->where("status", Profile::PUBLISHED);
        return $builder->get();
    }

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function users(){
        return $this->belongsTo(User::class, 'id');
    }
    public function posts()
    {
        return $this->hasMany(Post::class, 'post_id');
    }
}
