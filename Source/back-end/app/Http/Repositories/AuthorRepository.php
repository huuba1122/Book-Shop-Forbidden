<?php


namespace App\Http\Repositories;


use App\Models\Author;

class AuthorRepository
{
    function getAll(){
        return Author::orderBy('id','DESC')->get();
    }

    function findById($id){
        return Author::findOrFail($id);
    }

    function getInstance(): Author
    {
        return new Author();
    }

    function store($data)
    {
        return Author::create([
            'name' => $data['name'],
            'birth_death' => $data['birth_death'],
            'quantity' => $data['quantity'],
            'country' => $data['country'],
            'link_wiki' => $data['link_wiki'],
            'image' => $data['image']
        ]);
    }

    function update($author)
    {
        $author->update();
    }

    function delete($author)
    {
        $author->delete();
    }
}
