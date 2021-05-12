<?php

namespace App\Http\Controllers;

use App\Http\Services\HomeService;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;

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
        $this->homeService->addViewBook($id);
        $book = $this->homeService->showDetail($id);
        return response()->json($book, 200);
    }


    function findAuthorById($id)
    {
        $book = $this->homeService->findAuthorById($id);
        return response()->json($book);
    }


    function findCategoryById($id)
    {
        $books = $this->homeService->findByCategoryId($id);

        return response()->json($books);
    }

    // order

    function getOrdersByUserId()
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();
            $orders = $this->homeService->getOrdersByUserId($user->id);
        }catch (\Exception $e){
            return response()->json($e->getMessage());
        }

        return response()->json($orders);
    }

    function getOrderDetail($id)
    {
        $orders = $this->homeService->getOrderDetail($id);
        return response()->json($orders);
    }

    function getOrderById($id)
    {
        try {
            $order = $this->homeService->getOrderById($id);
            return response()->json($order);
        }catch (\Exception $e){
            return response()->json($e->getMessage());
        }

    }

    function cancelOrder($id)
    {
        try {
            $this->homeService->cancelOrder($id);
        }catch (\Exception $e){
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'success'
        ]);

    }

}
