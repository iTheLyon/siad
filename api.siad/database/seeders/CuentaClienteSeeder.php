<?php

namespace Database\Seeders;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class CuentaClienteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('cuenta_clientes')->insert(
            [
                'cliente_id' => 1,
                'denominacion'=> 'CUENTA ORDINARIA', 
                'tipo' =>  config('constants.TIPO_CUENTA_CLIENTE.REAL'),
                'saldo' => 0,                
                'fecha_caducidad' => '2099-12-01',
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]            
        );
    }
}
