<?php


namespace App\Http\Services;


use App\Http\Repositories\BookRepository;
use Illuminate\Support\Facades\Storage;
use App\Models\Book;

class BookService
{
    protected $bookRepo;
    protected $authorService;
    protected $categoryService;
    public function __construct(BookRepository $bookRepo, AuthorService $authorService, CategoryService $categoryService)
    {
        $this->bookRepo = $bookRepo;
        $this->authorService = $authorService;
        $this->categoryService = $categoryService;
    }

    function getAll()
    {
        return $this->bookRepo->getAll();
    }

    function findById($id){
        return $this->bookRepo->findById($id);
    }

   function showDetail($id)
   {
       return $this->bookRepo->showDetail($id);
   }

   function findByAuthorId($id)
   {
       return $this->bookRepo->findByAuthorId($id);
   }

   function findByCategoryId($id)
   {
       return $this->bookRepo->findByCategoryId($id);
   }

    function store($request){
        $data = json_decode($request->data, true);
        $book = new Book();
        $book->fill($data);
        $path = $request->file('file')->store('book-images', 'public');
        $book->image = $path;
        $this->bookRepo->store($book);
        $this->authorService->updateQuantity($data['stock'], $data['author_id']);
        $this->categoryService->updateQuantity($data['stock'], $data['category_id']);
    }
    function update($request, $id)
    {
        $data = json_decode($request->data, true);
        $book = $this->bookRepo->findById($id);
        $oldImage = $book->image;
        $oldAuthorId = $book->author_id;
        $oldCategoryId = $book->category_id;
        $oldQuantity = $book->stock;
        $newQuantity = $data['stock'] - $oldQuantity;
        $book->fill($data);
        if($request->hasFile('file')){
            $path = $request->file('file')->store('book-images', 'public');
            $book->image = $path;
            Storage::disk('public')->delete($oldImage);
        }
        $this->bookRepo->update($book);
        if($data['author_id'] == $oldAuthorId){
            $this->authorService->updateQuantity($newQuantity, $data['author_id']);
        }else{
            $this->authorService->updateQuantity($oldQuantity*(-1), $oldAuthorId);
            $this->authorService->updateQuantity($data['stock'], $data['author_id']);
        }
        if($data['category_id'] == $oldCategoryId){
            $this->categoryService->updateQuantity($newQuantity, $data['category_id']);
        }else{
            $this->categoryService->updateQuantity($oldQuantity*(-1), $oldCategoryId);
            $this->categoryService->updateQuantity($data['stock'], $data['category_id']);
        }
    }
    function delete($id)
    {
       $book = $this->bookRepo->findById($id);
       $authorId = $book->author_id;
       $categoryId = $book->category_id;
       $oldQuantity = $book->stock;
       $this->authorService->updateQuantity($oldQuantity*(-1), $authorId);
       $this->categoryService->updateQuantity($oldQuantity*(-1), $categoryId);
       $this->bookRepo->delete($book);
    }

    

    function searchBooks($search)
    {
        return $this->bookRepo->searchBooks($search);
    }
}
