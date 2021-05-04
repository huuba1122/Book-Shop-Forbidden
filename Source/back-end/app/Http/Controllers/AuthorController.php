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

    function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $dataAuthor = $this->authorService->store($request->all());
        if ($dataAuthor){
            return response()->json([
                'status' => 'success'
            ]);
        }else{
            return response()->json([
                'status' => 'error'
            ]);
        }
    }

    function update(Request $request, $id): \Illuminate\Http\JsonResponse
    {
//        dd($request->all(), $id);
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
        }catch (\Exception $e){
            return response()->json($e->getMessage(), 404);
        }
        return response()->json([
            'status' => 'delete author successfully'
        ], 200);
    }
}
