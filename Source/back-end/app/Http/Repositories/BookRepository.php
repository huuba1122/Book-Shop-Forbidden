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

    function findByAuthorId($id)
    {
        return DB::table('v_books')->where('author_id', '=', $id)->get();

        // return Book::where('author_id', '=', $id)->get();
    }

    function findByCategoryId($id)
    {
        return DB::table('v_books')->where('category_id', '=', $id)->get();

        // return Book::where('category_id', '=', $id)->get();
    }

    function showDetail($id)
    {
        return DB::table('v_books')->where('id', $id)->get();
    }

    function searchBooks($search)
    {
        return DB::table('v_books')
            ->where('name', 'LIKE', "%$search%")
            ->orWhere('author_name', 'LIKE', "%$search%")
            ->orWhere('category_name', 'LIKE', "%$search%")
            ->orderBy('name', 'ASC')
            ->get();
    }
}
