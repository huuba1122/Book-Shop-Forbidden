<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class CustomerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [   'name' => 'thang',
                'address' => 'ha noi',
                'phone' => '0981111111',
                'email' => 'thang@gmail.com',
                'password' => Hash::make('12345')
            ],
            [
                'name' => 'hung',
                'address' => 'ha noi',
                'phone' => '0981111222',
                'email' => 'hung@gmail.com',
                'password' => Hash::make('12345')
            ],
            [
                'name' => 'tuan',
                'address' => 'ha noi',
                'phone' => '0981111333',
                'email' => 'tuan@gmail.com',
                'password' => Hash::make('12345')
            ],
        ];
        DB::table('customers')->insert($data);
    }
}
