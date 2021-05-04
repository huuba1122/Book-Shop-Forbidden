<?php

namespace App\Http\Controllers;

use App\Models\Author;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    public function store(Request $request)
    {
        $author = new Author();

        $author->name = $request->name;
        $author->birth_death = $request->birth_death;
        $author->amount = $request->amount;
        $author->quantity = $request->quantity;
        $author->country = $request->country;
        $author->link_kiwi = $request->link_kiwi;
        $author->image = $request->image;

        $author->save();

        return response()->json($author);
    }
}
