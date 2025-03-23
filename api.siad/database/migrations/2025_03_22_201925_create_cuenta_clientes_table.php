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
        Schema::create('cuenta_clientes', function (Blueprint $table) {
            $table->id();
            $table->foreignId("cliente_id")->constrained("clientes")->onDelete("restrict");//evito eliminar
            $table->string("denominacion", 50);
            $table->string("tipo", 1);//1: real, 2: bono
            $table->decimal("saldo",10,2);
            $table->datetime("fecha_caducidad");            
            $table->string("estado",1);//1: activo , 0: eliminado , inactivo
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
        Schema::dropIfExists('cuenta_clientes');
    }
};
