<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $category = new Category();
        $category->name = 'Kinh điển';
        $category->save();

        $category = new Category();
        $category->name = 'Truyện ngắn';
        $category->save();

        $category = new Category();
        $category->name = 'Tiểu thuyết';
        $category->save();

        $category = new Category();
        $category->name = 'Nấu ăn';
        $category->save();

        $category = new Category();
        $category->name = 'Kỹ năng sống';
        $category->save();
    }
}
