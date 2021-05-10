<?php

namespace App\Http\Controllers;

use App\Http\Services\BookService;
use Illuminate\Http\Request;

class BookController extends Controller
{
    protected $bookService;
    public function __construct(BookService $bookService)
    {
        $this->bookService = $bookService;
    }

    function getAll(): \Illuminate\Http\JsonResponse
    {
        $books = $this->bookService->getAll();
        return response()->json($books, 201);
    }

    function findById($id): \Illuminate\Http\JsonResponse
    {
      $book = $this->bookService->findById($id);
      return response()->json($book);
    }

    function findByAuthorId($id): \Illuminate\Http\JsonResponse
    {
      $books = $this->bookService->findByAuthorId($id);
      return response()->json($books);
    }

    function findByCategoryId($id): \Illuminate\Http\JsonResponse
    {
      $books = $this->bookService->findByCategoryId($id);
      return response()->json($books);
    }

    function showDetail($id)
    {
       $book = $this->bookService->showDetail($id);
       return response()->json($book, 200);
    }

    function store(Request $request): \Illuminate\Http\JsonResponse
    {
        try {
            $this->bookService->store($request);
        }catch (\Exception $e){
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'success'
        ]);
    }

    function update(Request $request, $id): \Illuminate\Http\JsonResponse
    {

         try {
             $this->bookService->update($request, $id);
         }catch (\Exception $e){
             return response()->json($e->getMessage());
         }
         return response()->json([
            'status' => 'success'
        ]);
    }

    function delete($id): \Illuminate\Http\JsonResponse
    {
         try {
             $this->bookService->delete($id);
         } catch (\Exception $e){
             return response()->json($e->getMessage());
         }
         return response()->json([
             'status' => 'success'
         ]);

    }

    function searchBooks(Request $request)
    {
         try{
            $books = $this->bookService->searchBooks($request->data);
            return response()->json($books, 200);
         }catch (\Exception $e){
            return response()->json($e->getMessage());
        }
         
    }

    function countBooks()
    {
        $quantityBooks = $this->bookService->countBooks();
        return response()->json($quantityBooks, 200);
    }

    function getTenbook()
    {
        $books = $this->bookService->getTenbook();
        return response()->json($books, 200);
    }
}
