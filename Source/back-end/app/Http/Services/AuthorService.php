<?php


namespace App\Http\Services;


use App\Http\Repositories\AuthorRepository;
use App\Models\Author;

class AuthorService
{
     protected $authorRepo;
     public function __construct(AuthorRepository $authorRepo)
     {
         $this->authorRepo = $authorRepo;
     }
     function getAll()
     {
         return $this->authorRepo->getAll();
     }
     function findById($id)
     {
         return $this->authorRepo->findById($id);
     }
     function store($request)
     {
         $author = new Author();
         $author->fill($request);
         $this->authorRepo->store($author);
     }
     function update($request, $id)
     {
         $author = $this->authorRepo->findById($id);
         $author->fill($request);
         $this->authorRepo->store($author);
     }
     function delete($id)
     {
         $author = $this->authorRepo->findById($id);
         $this->authorRepo->delete($author);
     }
}
