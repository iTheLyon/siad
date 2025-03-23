<?php

namespace Database\Seeders;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class TipoCanalComunicacionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_canal_comunicacions')->insert(
            [
                'nombre' => 'WHATSAPP',                
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);            
        
        DB::table('tipo_canal_comunicacions')->insert(
            [
                'nombre' => 'TELEGRAM',                
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);

        DB::table('tipo_canal_comunicacions')->insert(            
            [
                'nombre' => 'FACEBOOK MESSENGER',                
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );
    }
}
