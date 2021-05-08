<?php


namespace App\Http\Repositories;


use App\Models\Book;
use Illuminate\Support\Facades\DB;

class BookRepository
{
    function getAll()
    {
        // return Book::orderBy('id', 'DESC')->get();
        return DB::table('v_books')->orderBy('id', 'DESC')->get();
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

    function update($book){
        $book->update();
    }

    function delete($book)
    {
       $book->delete();
    }

}
