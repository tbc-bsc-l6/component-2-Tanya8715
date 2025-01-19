<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductHasTag;


class Product extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function tags()
    {
        return $this->hasMany(ProductHasTag::class,'product_id');
    }
}
