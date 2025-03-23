<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class CanalComunicacionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('canal_comunicacions')->insert(
            [
                'nombre' => 'WHATSAPP LIMA',                
                'url_referencia' => 'https://wa.me/51999999999',                
                'tipo_canal_comunicacions_id' => 1,//whatsapp
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);
        
            DB::table('canal_comunicacions')->insert(        
            [
                'nombre' => 'TELEGRAM OFICIAL',                
                'url_referencia' => 'https://t.me/siad',
                'tipo_canal_comunicacions_id' => 2,//telegram
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]);
        
            DB::table('canal_comunicacions')->insert(                        
            [
                'nombre' => 'FACEBOOK OFICIAL',         
                'url_referencia' => 'https://m.me/siad',
                'tipo_canal_comunicacions_id' => 3,//facebook       
                'estado' => 1,
                'usuario_registro' => 'admin'
            ]
        );
    }
}
