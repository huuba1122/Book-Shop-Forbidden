<?php


namespace App\Http\Services;

use App\Http\Repositories\AuthorRepository;
use App\Http\Repositories\BookRepository;
use App\Http\Repositories\CategoryRepository;
use App\Http\Repositories\OrderRepository;

class HomeService
{
    protected $bookRepo;
    protected $authorRepo;
    protected $categoryRepo;
    protected $orderRepo;

    public function __construct(AuthorRepository $authorRepo, BookRepository $bookRepo, CategoryRepository $categoryRepo, OrderRepository $orderRepository)
    {
        $this->authorRepo = $authorRepo;
        $this->bookRepo = $bookRepo;
        $this->categoryRepo = $categoryRepo;
        $this->orderRepo = $orderRepository;
    }

    function index()
    {

    }

    function getTenNewBooks()
    {
        return $this->bookRepo->getTenBook();
    }

    function getTopicBooks($column)
    {
        return $this->bookRepo->getTopicBooks($column);
    }

    function getAllBooks()
    {
        return $this->bookRepo->getAll();
    }

    function getAllAuthors()
    {
        return $this->authorRepo->getAll();
    }

    function getAllCategories()
    {
        return $this->categoryRepo->getAll();
    }

    function search($search)
    {
        return $this->bookRepo->searchBooks($search);
    }

    function findByAuthorId($id)
    {
        return $this->bookRepo->findByAuthorId($id);
    }

    function showDetail($id)
    {
        return $this->bookRepo->showDetail($id);
    }


    function findByCategoryId($id)
    {
        return $this->bookRepo->findByCategoryId($id);
    }

    function findAuthorById($id)
    {
        return $this->authorRepo->findAuthorById($id);
    }

    function addViewBook($id)
    {
        $book = $this->bookRepo->findById($id);
        $book->view = $book->view + 1;
        $this->bookRepo->update($book);
    }

    // order

    function getOrderDetail($id)
    {
        return $this->orderRepo->getDetailOdersById($id);
    }

    function getOrderById($id)
    {
        return $this->orderRepo->findOrderById($id);
    }

    function cancelOrder($id)
    {
        $order = $this->orderRepo->findOrderById($id);
        $order->status = 'Hủy đơn hàng';
        $this->orderRepo->update($order);
    }

    function getOrdersByUserId($id)
    {
        return $this->orderRepo->getOrdersByUserId($id);
    }

}
