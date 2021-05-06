<?php


namespace App\Http\Services;


use App\Http\Repositories\BookRepository;
use App\Models\Book;

class BookService
{
    protected $bookRepo;
    public function __construct(BookRepository $bookRepo)
    {
        $this->bookRepo = $bookRepo;
    }
    function getAll()
    {
        return $this->bookRepo->getAll();
    }
    function findById($id){
        return $this->bookRepo->findById($id);
    }
    function store($request){
        $book = new Book();
        $book->fill($request);
        $this->bookRepo->store($book);
    }
    function update($request, $id)
    {
        $book = $this->bookRepo->findById($id);
        $book->fill($request);
        $this->bookRepo->store($book);
    }
    function delete($id)
    {
       $book = $this->bookRepo->findById($id);
       $this->bookRepo->delete($book);
    }

}
