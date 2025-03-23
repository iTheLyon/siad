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
        Schema::create('cuenta_bancarias', function (Blueprint $table) {
            $table->id();
            $table->foreignId("caja_bancos_id")->constrained("caja_bancos")->onDelete("restrict");//evito eleiminarcargo_id
            $table->string("numero_cuenta", 20);
            $table->string("cci", 20);
            $table->string("tipo", 1);//0 : no_especificado ,1: corriente, 2:ahorro, 3 : plazo fijo          
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
        Schema::dropIfExists('cuenta_bancarias');
    }
};
