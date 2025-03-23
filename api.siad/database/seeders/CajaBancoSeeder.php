<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class CajaBancoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $caja_banco_id=DB::table('caja_bancos')->insertGetId(
            [
                'nombre' => 'BANCO INTERBANK',
                'tipo' =>  config('constants.TIPO_CAJA_BANCO.BANCO'),
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );

        DB::table('cuenta_bancarias')->insert([
            [
                'caja_bancos_id' => $caja_banco_id, 
                'numero_cuenta' =>"011-1269121-01", 
                'cci' => '011-12315-0151-01', 
                'tipo' => config('constants.TIPO_CUENTA_BANCARIA.AHORRO'),
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        ]);


        $caja_banco_id=DB::table('caja_bancos')->insertGetId(
            [
                'nombre' => 'BANCO CREDITO DEL PERU (BCP)',
                'tipo' =>  config('constants.TIPO_CAJA_BANCO.BANCO'),
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );

        DB::table('cuenta_bancarias')->insert([
            [
                'caja_bancos_id' => $caja_banco_id, 
                'numero_cuenta' =>"0803-1269121-01", 
                'cci' => '0803-12315-0151-01', 
                'tipo' => config('constants.TIPO_CUENTA_BANCARIA.CORRIENTE'),
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        ]);

    }
}
