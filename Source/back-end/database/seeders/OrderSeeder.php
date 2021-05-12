<?php

namespace Database\Seeders;

use App\Models\Order;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Seeder;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $order = new Order();
        $order->user_id ='3';
        $order->amount ='324324';
        $order->order_date ='2000/01/02';
        $order->status ='Đang xử lý ';
        $order->des = 'Tôi muốn nhận vào giữa trưa';
        $order->ms ='othQp72113';
        $order->save();

        $order = new Order();
        $order->user_id ='3';
        $order->amount ='4000';
        $order->order_date ='2000/06/02';
        $order->status ='Đang xử lý ';
        $order->des = 'Tôi muốn nhận vào tối';
        $order->ms ='nthQp72158';
        $order->save();

        $order = new Order();
        $order->user_id ='3';
        $order->amount ='90000';
        $order->order_date ='2002/07/07';
        $order->status ='Đang xử lý ';
        $order->des = 'Tôi muốn nhận vào ngày kia';
        $order->ms ='lthQp12990';
        $order->save();
    }
}
