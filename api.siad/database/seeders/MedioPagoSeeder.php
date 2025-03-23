<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class MedioPagoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('medio_pagos')->insert(
            [
                'nombre' => 'DEPOSITO BANCARIO',
                'alias' => 'DEPOSITO',                                
                'monto_minimo' => 0,
                'monto_maximo' => 9999,
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);
        DB::table('medio_pagos')->insert(
            [
                'nombre' => 'TRANSFERENCIA BANCARIA',
                'alias' => 'TRANSFERENCIA',                                
                'monto_minimo' => 0,
                'monto_maximo' => 10000,
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);

        DB::table('medio_pagos')->insert(            
            [
                'nombre' => 'AGENTE KASNET',
                'alias' => 'AGENTE KASNET',                                
                'monto_minimo' => 0,
                'monto_maximo' => 500,
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );
    }
}
