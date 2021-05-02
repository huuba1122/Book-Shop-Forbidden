<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $guarded = [
        'image',
        'recommend',
        'best_seller',
        'view'
    ];
    use HasFactory;
}
