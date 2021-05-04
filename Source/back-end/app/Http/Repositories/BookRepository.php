<?php


namespace App\Http\Repositories;


use App\Models\Book;

class BookRepository
{
    function getAll()
    {
        return Book::orderBy('id', 'DESC')->get();
    }

    function findById($id)
    {
        return Book::findOrFail($id);
    }
//   function getInstance(): Book{
//       return new Book();
//   }
    function store($book)
    {
        $book->save();
    }

    function delete($book)
    {
       $book->delete();
    }

}
