<?php

namespace App\Http\Controllers;

use App\Http\Services\AuthorService;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    protected $authorService;
    public function __construct(AuthorService $authorService)
    {
        $this->authorService= $authorService;
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
    function store(Request $request): \Illuminate\Http\JsonResponse
    {
        try {
            $this->authorService->store($request->all());
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
            $this->authorService->update($request->all(), $id);
        }catch (\Exception $e){
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'update author successfully'
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
            'status' => 'delete success'
        ]);

    }
}
