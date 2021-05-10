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

}
