<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TPStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $TPStatus = [
            ['name' => 'Accepted', 'code' => '3'],
            ['name' => 'pending', 'code' => '2'],
            ['name' => 'Done', 'code' => '4'],
            ['name' => 'Cancelled', 'code' => '5']
        ];

        DB::table('t_p_statuses')->insert($TPStatus);
    }
}
