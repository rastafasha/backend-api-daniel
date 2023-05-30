<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'adicional',
        'slug',
        'user_id',
        'category_id',
        'favorite_id',
        'isFeatured',
        'image',
        'status',
    ];

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';

    /*
    |--------------------------------------------------------------------------
    | functions
    |--------------------------------------------------------------------------
    */

    public function scopeForPublic(Builder $builder)
    {
        $builder->where("status", Post::PUBLISHED);
        return $builder->get();
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

    public function categories()
    {
        return $this->hasMany(Category::class, 'id');
    }

    public function profile()
    {
        return $this->hasMany(Profile::class, 'favorite_id');
    }

    public static function search($query = ''){
        if(!$query){
            return self::all();
        }
        return self::where('title', 'like', "%$query%")
        ->orWhere('description', 'like', "%$query%")
        ->get();
    }

}
