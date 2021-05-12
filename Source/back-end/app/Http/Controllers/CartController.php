<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Orderdetail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PHPUnit\TextUI\Exception;
use Tymon\JWTAuth\Facades\JWTAuth;

class CartController extends Controller
{
    function showCart($id)
    {
        $carts = Cart::where('customer_id', $id)->get();
        if (count($carts) > 0) {
            return response()->json($carts);
        } else {
            return response()->json([
                'status' => 'empty'
            ]);
        }
    }

    function addToCart(Request $request)
    {
        try {
            $carts = Cart::where('customer_id', $request->customerId)->where('book_id', $request->bookId)->get();
            if (count($carts) > 0) {
                $quantity = $carts[0]->quantity + 1;
                $cart = Cart::where('customer_id', $request->customerId)->where('book_id', $request->bookId)
                    ->update([
                        'quantity' => $quantity,
                        'total_price' => $carts[0]->book_price * $quantity,
                    ]);
            } else {
                $book = Book::findOrFail($request->bookId);
                $cart = Cart::create([
                    'customer_id' => $request->customerId,
                    'book_id' => $book->id,
                    'book_name' => $book->name,
                    'quantity' => 1,
                    'book_price' => $book->price,
                    'image' => $book->image,
                    'total_price' => $book->price,
                ]);
            }
        } catch (\Exception $e) {
            return response()->json($e->getMessage());
        }

        return response()->json(['status' => 'success']);
    }

    function cartInfo($id)
    {
        $totalQuantity = Cart::where('customer_id', $id)->sum('quantity');
        $totalPrice = Cart::where('customer_id', $id)->sum(DB::raw('quantity * book_price'));
        return response()->json([
            'totalQuantity' => $totalQuantity,
            'totalPrice' => $totalPrice
        ]);
    }

    function deleteCart($id)
    {
        try {
            Cart::where('customer_id', $id)->delete();
        } catch (\Exception $e) {
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'success'
        ]);
    }

    function updateItemQuantity(Request $request)
    {
        try {
           $carts = Cart::where('customer_id', $request->customerId)->where('book_id', $request->bookId)->get();
            Cart::where('customer_id', $request->customerId)->where('book_id', $request->bookId)
                ->update([
                    'quantity' => $request->quantity,
                    'total_price' => $carts[0]->book_price * $request->quantity,
                ]);
        } catch (\Exception $e) {
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'success'
        ]);
    }

    function removeItem(Request $request)
    {
        try {
            Cart::where('customer_id', $request->customerId)->where('book_id', $request->bookId)->delete();
        } catch (\Exception $e) {
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'success'
        ]);
    }

    function checkout(Request $request)
    {
        $user = JWTAuth::parseToken()->authenticate();
        $carts = Cart::where('customer_id', $user->id)->get();
        $totalPrice = Cart::where('customer_id', $user->id)->sum('total_price');
        DB::beginTransaction();
        try {
            $order = new Order();
            $order->user_id = $user->id;
            $order->order_date = date('Y-m-d');
            $order->status = 'Đang xử lý';
            $order->amount = $totalPrice;
            $order->des = $request->des;
            $order->save();
            foreach ($carts as $item) {
                $orderDetail = new Orderdetail();
                $orderDetail->order_id = $order->id;
                $orderDetail->book_id = $item->book_id;
                $orderDetail->quantity = $item->quantity;
                $orderDetail->price = $item->total_price;
                $orderDetail->save();
            }
            DB::commit();
        }catch ( \Exception $e){
            DB::rollBack();
            return response()->json($e->getMessage());
        }
        return response()->json([
            'status' => 'success'
        ]);
    }

    function getOrderUser()
    {
        $user = JWTAuth::parseToken()->authenticate();
        
    }
}
