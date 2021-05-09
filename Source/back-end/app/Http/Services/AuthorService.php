<?php


namespace App\Http\Services;


use App\Http\Repositories\AuthorRepository;
use App\Http\Repositories\BookRepository;
use Illuminate\Support\Facades\Storage;
use App\Models\Author;

class AuthorService
{
     protected $authorRepo;
     protected $bookRepo;
     public function __construct(AuthorRepository $authorRepo, BookRepository $bookRepo)
     {
         $this->authorRepo = $authorRepo;
         $this->bookRepo = $bookRepo;
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
         $author->fill($request->all());
         $path = $request->file('file')->store('author-images', 'public');
         $author->image = $path;
         $this->authorRepo->store($author);
     }

     function update($request, $id)
     {
         $author = $this->authorRepo->findById($id);
         $oldImage = $author->image;
         $author->fill($request->all());
         if($request->hasFile('file')){
            $path = $request->file('file')->store('author-images', 'public');
            $author->image = $path;
            Storage::disk('public')->delete($oldImage);
         }
         $this->authorRepo->update($author);
     }

     function updateQuantity($number, $id)
     {
        $author = $this->authorRepo->findById($id);
        $oldQuantity = $author->quantity;
        $author->quantity = $number + $oldQuantity;
        $this->authorRepo->update($author);
     }

     function delete($id)
     {
        $author = $this->authorRepo->findById($id);
        $books = $this->bookRepo->findByAuthorId($id);
        foreach($books as $key => $value)
        {
            $book = $this->bookRepo->findById($value->id);
            $book->author_id = 1;
            $quantity = $value->stock;
            $this->updateQuantity($quantity, 1);
            $this->bookRepo->update($book);
        }
        $this->authorRepo->delete($author);
     }

     function search($search)
    {
//        print_r($search['name']);
        return $this->authorRepo->search($search['name']);
    }
}
