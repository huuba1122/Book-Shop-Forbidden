<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    protected $fillable = [
        'name',
        'birth_of_year',
        'death_of_year',
        'country',
        'link_wiki',
    ];
    use HasFactory;
}
