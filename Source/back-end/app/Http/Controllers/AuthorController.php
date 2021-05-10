<?php

namespace App\Http\Controllers;

use App\Http\Services\AuthorService;

use App\Models\Author;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    protected $authorService;
    public function __construct(AuthorService $authorService)
    {
        $this->authorService = $authorService;
    }

    function getAll(): \Illuminate\Http\JsonResponse
    {
        $authors = $this->authorService->getAll();
        return response()->json($authors, 201);
    }

    function findById($id): \Illuminate\Http\JsonResponse
    {
        $author = $this->authorService->findById($id);
        return response()->json($author);
    }
    
    function store(Request $request)
    {
        try {
            $this->authorService->store($request);
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
            $this->authorService->update($request, $id);
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
            $this->authorService->delete($id);
        } catch (\Exception $e){
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'success'
        ]);
    }

    function search(Request $request): \Illuminate\Http\JsonResponse
    {
        
        $authors = $this->authorService->search($request->all());
        return response()->json($authors, 200);
    }

    function countAuthors()
    {
        $quantityAuthors = $this->authorService->countAuthors();
        return response()->json($quantityAuthors, 200);
    }

    function getTenAuthor()
    {
        $authors = $this->authorService->getTenAuthor();
        return response()->json($authors, 200);
    }
}
