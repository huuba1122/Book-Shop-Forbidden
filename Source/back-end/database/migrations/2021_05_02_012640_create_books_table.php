<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('books', function (Blueprint $table) {
            $table->id();
            $table->string('isbn');
            $table->string('name');
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('author_id');
            $table->unsignedBigInteger('publisher_id');
            $table->integer('reprint_of_book')->default(1);
            $table->text('description');
            $table->text('content');
            $table->date('year_of_publication')->nullable();
            $table->string('license')->nullable();
            $table->string('image')->nullable();
            $table->unsignedBigInteger('view')->default(0);
            $table->integer('recommend')->default(0);
            $table->integer('best_seller')->default(0);
            $table->unsignedBigInteger('stock')->default(1);
            $table->unsignedBigInteger('page_number')->nullable();
            $table->string('language');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('books');
    }
}
