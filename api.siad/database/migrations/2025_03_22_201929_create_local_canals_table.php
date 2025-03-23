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
        Schema::create('local_canals', function (Blueprint $table) {
            $table->id();
            $table->foreignId("local_id")->constrained("locals")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("canal_comunicacions_id")->constrained("canal_comunicacions")->onDelete("restrict");//evito eleiminarcargo_id
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
        Schema::dropIfExists('local_canals');
    }
};
