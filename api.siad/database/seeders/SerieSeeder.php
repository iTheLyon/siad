<?php

namespace Database\Seeders;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;


class SerieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('series')->insert(
            [
                'tipo_documentos_id' => 1,
                'serie_documento' => 'V001',
                'ultimo_numero' => 0,
                'locals_id'=>1,                
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);
    }
}
