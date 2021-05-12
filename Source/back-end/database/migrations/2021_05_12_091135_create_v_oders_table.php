<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVOdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("
        CREATE VIEW v_oders AS SELECT orders.*,
        users.name as user_name, users.email as user_email,
        users.address as user_address, users.phone as user_phone,
        orderdetails.book_id, orderdetails.quantity as book_quantiy,
        orderdetails.price, books.name
        FROM orders JOIN users ON orders.user_id = users.id
        JOIN orderdetails ON orders.id = orderdetails.order_id
        JOIN books ON orderdetails.book_id = books.id
    ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('v_orders');
    }
}
