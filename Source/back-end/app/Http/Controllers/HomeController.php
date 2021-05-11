<?php

namespace App\Http\Controllers;

use App\Http\Services\HomeService;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    protected $homeService;
    public function __construct(HomeService $homeService)
    {
        $this->homeService = $homeService;
    }

    function index()
    {
        $books = $this->homeService->getAllBooks();
        return response()->json($books);
    }

    function getTopicBooks(Request $request)
    {
        $books = $this->homeService->getTopicBooks($request->column);
        return response()->json($books);
    }

    function search(Request $request)
    {
        $books = $this->homeService->search($request->search);
        return response()->json($books);
    }

    function getAllAuthors()
    {
        $authors = $this->homeService->getAllAuthors();
        return response()->json($authors);
    }

    function getAllCategories()
    {
        $categories = $this->homeService->getAllCategories();
        return response()->json($categories);
    }
    function getTenNewBooks()
    {
        $books = $this->homeService->getTenNewBooks();
        return response()->json($books);
    }

    function findByAuthorId($id)
    {
      $books = $this->homeService->findByAuthorId($id);
      return response()->json($books);
    }

    function showDetail($id)
    {
       $book = $this->homeService->showDetail($id);
       return response()->json($book, 200);
    }

}
