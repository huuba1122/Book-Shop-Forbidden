<?php


namespace App\Http\Services;

use App\Http\Repositories\AuthorRepository;
use App\Http\Repositories\BookRepository;
use App\Http\Repositories\CategoryRepository;

class HomeService
{
    protected $bookRepo;
    protected $authorRepo;
    protected $categoryRepo;

    public function __construct(AuthorRepository $authorRepo, BookRepository $bookRepo, CategoryRepository $categoryRepo)
     {
         $this->authorRepo = $authorRepo;
         $this->bookRepo = $bookRepo;
         $this->categoryRepo = $categoryRepo;
     }

     function index()
     {

     }

     function getTenNewBooks(){
        return $this->bookRepo->getTenBook();
     }

     function getTopicBooks($column)
     {
        return $this->bookRepo->getTopicBooks($column);
     }

     function getAllBooks()
     {
         return $this->bookRepo->getAll();
     }

     function getAllAuthors()
     {
         return $this->authorRepo->getAll();
     }

     function getAllCategories()
     {
         return $this->categoryRepo->getAll();
     }

     function search($search)
     {
         return $this->bookRepo->searchBooks($search);
     }

     function findByAuthorId($id)
     {
       return $this->bookRepo->findByAuthorId($id);
     }
   
   function showDetail($id)
     {
       return $this->bookRepo->showDetail($id);
     }

     
   function findByCategoryId($id)
     {
       return $this->bookRepo->findByCategoryId($id);
     }

}
