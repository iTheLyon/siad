<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class TipoTransaccionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_transaccions')->insert(
            [
                'nombre' => 'RECARGA DE SALDO',
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);
            
        DB::table('tipo_transaccions')->insert(            
            [
                'nombre' => 'RETIRO DE SALDO',
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );
    }
}
