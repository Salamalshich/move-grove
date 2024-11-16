<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TripStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $TripStatuses = [
            ['name' => 'Avilable', 'code' => '1'],
            ['name' => 'Done', 'code' => '4'],
            ['name' => 'Cancelled', 'code' => '5']
        ];

        DB::table('trip_statuses')->insert($TripStatuses);
    }
}
