<?php

namespace App\Http\Controllers;

use App\Http\Services\OrderService;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{

    protected $orderService;
    public function __construct(OrderService $orderService)
    {
        $this->orderService = $orderService;
    }

    public  function index(): \Illuminate\Http\JsonResponse
    {
        $orders = Order::all();
        return response()->json($orders);
    }

    public function showOrder(Order $order, $id): \Illuminate\Http\JsonResponse
    {
        $orderdetail = DB::table('orderdetails')->where('order_id', $id);

        return response()->json($orderdetail);
    }

    function getAll()
    {
        $orders = $this->orderService->getAllOrder();
        return response()->json($orders);
    }

    function countOrders()
    {
        $quantityOrders = $this->orderService->countOrders();
        return response()->json($quantityOrders, 200);
    }
}
