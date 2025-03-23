<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class LocalCanalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('local_canals')->insert([
            [
                'local_id' => 1, 
                'canal_comunicacions_id' => 1,                 
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        ]);
        DB::table('local_canals')->insert([
            [
                'local_id' => 1, 
                'canal_comunicacions_id' => 2,                 
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        ]);
        DB::table('local_canals')->insert([
            [
                'local_id' => 1, 
                'canal_comunicacions_id' => 3,                 
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        ]);

    }
}
