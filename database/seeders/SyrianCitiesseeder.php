<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class SyrianCitiesseeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $cities = [
            ['name' => 'دمشق'],
            ['name' => 'ريف دمشق'],
            ['name' => 'حلب'],
            ['name' => 'حمص'],
            ['name' => 'حماة'],
            ['name' => 'اللاذقية'],
            ['name' => 'طرطوس'],
            ['name' => 'درعا'],
            ['name' => 'السويداء'],
            ['name' => 'دير الزور'],
            ['name' => 'الحسكة'],
            ['name' => 'الرقة'],
            ['name' => 'إدلب'],
            ['name' => 'القنيطرة']
        ];

        DB::table('cities')->insert($cities);
    }
}
