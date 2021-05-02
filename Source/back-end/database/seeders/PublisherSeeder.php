<?php

namespace Database\Seeders;

use App\Models\Publisher;
use Illuminate\Database\Seeder;

class PublisherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $publisher = new Publisher();
        $publisher->name = 'NXB kim đồng';
        $publisher->save();

        $publisher = new Publisher();
        $publisher->name = 'NXB giáo dục';
        $publisher->save();

        $publisher = new Publisher();
        $publisher->name = 'NXB thời đại';
        $publisher->save();

        $publisher = new Publisher();
        $publisher->name = 'NXB khoa học và kỹ thuật';
        $publisher->save();

        $publisher = new Publisher();
        $publisher->name = 'NXB Kim Đồng';
        $publisher->save();
    }
}
