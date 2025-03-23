<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class LocalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $local_id=DB::table('locals')->insertGetId(
            [
                'nombre' => 'LOCAL MIRAFLORES II',
                'direccion' => 'Av. Larco 1234',
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );

        DB::table('local_caja_bancos')->insert([
            [
                'local_id' => $local_id, 
                'caja_bancos_id' => 1,                 
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        ]);

        DB::table('local_caja_bancos')->insert([
            [
                'local_id' => $local_id, 
                'caja_bancos_id' => 2,                 
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        ]);
    }
}
