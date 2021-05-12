<?php


namespace App\Http\Services;


use App\Http\Repositories\OrderRepository;

class OrderService
{
    protected $orderRepo;
    public function __construct(OrderRepository $orderRepo)
    {
        $this->orderRepo = $orderRepo;
    }

    function getAllOrder(): \Illuminate\Support\Collection
    {
        return $this->orderRepo->getAll();
    }

    function countOrders()
    {
        return $this->orderRepo->countOrders();
    }
}
