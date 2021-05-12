<?php


namespace App\Http\Repositories;


use App\Models\Order;
use Illuminate\Support\Facades\DB;

class OrderRepository
{
    function getAll(): \Illuminate\Support\Collection
    {
        return DB::table('v_oders')
            ->select(['id', 'user_name','amount','order_date', 'status', 'ms','des'])
            ->orderBy('id', 'DESC')
            ->groupBy('id')
            ->get();
    }

    function findOrderById($id){
        return Order::findOrFail($id);
    }

    function update($order)
    {
        $order->save();
    }

    function countOrders()
    {
        return Order::count();
    }
}
