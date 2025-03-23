<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class EmpleadoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('empleados')->insert(
            [
                'dni' => '45678912',
                'nombres' => 'MARIO',
                'apellidos' => 'MARTINEZ',
                'cargo_id' => 1,
                'sueldo' => 1500,
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );
    }
}
