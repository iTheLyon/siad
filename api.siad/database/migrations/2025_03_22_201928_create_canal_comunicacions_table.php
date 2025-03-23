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
        Schema::create('canal_comunicacions', function (Blueprint $table) {
            $table->id();
            $table->string("nombre", 50);
            $table->string("url_referencia", 50);//url
            $table->foreignId("tipo_canal_comunicacions_id")->constrained("tipo_canal_comunicacions")->onDelete("restrict");//evito eliminar
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
        Schema::dropIfExists('canal_comunicacions');
    }
};
