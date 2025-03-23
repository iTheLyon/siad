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
        Schema::create('transaccions', function (Blueprint $table) {
            $table->id();
            $table->foreignId("tipo_transaccions_id")->constrained("tipo_transaccions")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("cuenta_clientes_id")->constrained("cuenta_clientes")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("clientes_id")->constrained("clientes")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("caja_bancos_id")->constrained("caja_bancos")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("empleados_id")->constrained("empleados")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("locals_id")->constrained("locals")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("canal_comunicacions_id")->constrained("canal_comunicacions")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("tipo_documentos_id")->constrained("tipo_documentos")->onDelete("restrict");//evito eleiminarcargo_id
            $table->string("serie_documento", 4);
            $table->integer("numero_documento");
            $table->date("fecha_emision");
            $table->string("hora_emision");
            $table->foreignId("medio_pagos_id")->constrained("medio_pagos")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("monedas_id")->constrained("monedas")->onDelete("restrict");//evito eleiminarcargo_id
            $table->decimal("tipo_cambio", 10,3);
            $table->decimal("monto_ingreso", 10,2);
            $table->decimal("monto_egreso", 10,2);
            $table->decimal("monto", 10,2);
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
        Schema::dropIfExists('transaccions');
    }
};
