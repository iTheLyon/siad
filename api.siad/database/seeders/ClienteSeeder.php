<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class ClienteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('clientes')->insert(
            [
                'player_id' => 'NET609',
                'dni'=> '43206060', 
                'nombres' => 'NICKY SALOMON',
                'apellidos' => 'ENRIQUEZ TORRES',
                'email' => 'enriquez.net@gmail.com',
                'whatsapp' => '980148718',
                'celular' => '980148718',
                'direccion' => 'CALLE LOS SAUCES 123',
                'genero' => '1',//masculino
                'fecha_nacimiento' => '1985-04-04',
                'caja_bancos_id' => 1,
                'numero_cuenta_bancaria' => '0011-0000-1234567890',
                'cci_cuenta_bancaria' => '0011-0000-1234567890',
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]            
        );
    }
}
