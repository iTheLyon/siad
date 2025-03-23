<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;


class MonedaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('monedas')->insert(
            [
                'nombre' => 'NUEVOS SOLES',
                'simbolo' => 'S/',                                                
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);
    }
}
