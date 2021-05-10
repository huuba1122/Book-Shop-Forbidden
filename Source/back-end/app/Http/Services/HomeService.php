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

     function getTopicBooks($column)
     {
        return $this->bookRepo->getTopicBooks($column);
     }

     function getAllBooks()
     {
         return $this->bookRepo->getAll();
     }
}