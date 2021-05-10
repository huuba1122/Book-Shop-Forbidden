<?php

namespace App\Http\Controllers;

use App\Http\Services\CategoryService;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    protected $categoryService;
    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }

    function getAll(): \Illuminate\Http\JsonResponse
    {
        $categories = $this->categoryService->getAll();
        return response()->json($categories, 201);
    }

    function findById($id): \Illuminate\Http\JsonResponse
    {
        $category = $this->categoryService->findById($id);
        return response()->json($category);
    }

    function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $dataCategory = $this->categoryService->store($request->all());
        if ($dataCategory){
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
            $this->categoryService->update($request->all(), $id);
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
            $this->categoryService->delete($id);
        }catch (\Exception $e){
            return response()->json($e->getMessage(), 404);
        }
        return response()->json([
           'status' => 'success'
        ], 200);
    }

    function search(Request $request): \Illuminate\Http\JsonResponse
    {
        
        $categories = $this->categoryService->search($request->all());
        return response()->json($categories, 200);
    }

    function countCategories()
    {
        $quantityCategories = $this->categoryService->countCategories();
        return response()->json($quantityCategories, 200);
    }
}
