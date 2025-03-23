<?php

namespace Database\Seeders;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class CargoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('cargos')->insert(
            [
                'nombre' => 'ASESOR DE VENTAS',
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);
            
        DB::table('cargos')->insert(            
            [
                'nombre' => 'JEFE DE ZONA',
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );
    }
}
