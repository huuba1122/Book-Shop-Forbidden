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
    function store(Request $request): \Illuminate\Http\JsonResponse
    {
        if($request->hasFile())

        try {
            $this->bookService->store($request->all());
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
             $this->bookService->update($request->all(), $id);
         }catch (\Exception $e){
             return response()->json($e->getMessage());
         }
         return response()->json([
             'status' => 'update book successfully'
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
             'status' => 'delete success'
         ]);

     }

}
