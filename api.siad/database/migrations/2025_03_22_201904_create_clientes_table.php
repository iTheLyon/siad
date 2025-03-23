<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clientes', function (Blueprint $table) {
            $table->id();            
            $table->string("player_id", 10)->unique();//AUS852
            $table->string("dni", 8);
            $table->string("nombres", 50);
            $table->string("apellidos", 50);
            $table->string("email", 30);
            $table->string("whatsapp", 12);
            $table->string("direccion", 80);
            $table->string("celular", 12);
            $table->string("genero", 1);//1: masculino, 2 : femenino
            $table->date("fecha_nacimiento");
            $table->foreignId("caja_bancos_id")->constrained("caja_bancos")->onDelete("restrict");//evito eliminar
            $table->string("numero_cuenta_bancaria", 20);
            $table->string("cci_cuenta_bancaria", 20);
            $table->string("estado",1);//1: activo , 0: eliminado
            $table->string("usuario_registro",45);
            $table->string("usuario_modificacion",45)->nullable();          
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('clientes');
    }
};
