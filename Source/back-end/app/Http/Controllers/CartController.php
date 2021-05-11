<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PHPUnit\TextUI\Exception;

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
                $cart = Cart::where('customer_id', $request->customerId)->where('book_id', $request->bookId)
                    ->update([
                        'quantity' => $carts[0]->quantity + 1
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
//            $carts = Cart::where('customer_id', $request->customerId)->where('book_id', $request->bookId)->get();
            Cart::where('customer_id', $request->customerId)->where('book_id', $request->bookId)
                ->update([
                    'quantity' => $request->quantity
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
}
