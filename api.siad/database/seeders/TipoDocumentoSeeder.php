<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class TipoDocumentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_documentos')->insert(
            [
                'nombre' => 'VOUCHER INGRESO',                
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);
    }
}
