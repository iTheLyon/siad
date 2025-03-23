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
        Schema::create('transaccion_cuenta_bancarias', function (Blueprint $table) {
            $table->id();
            $table->foreignId("transaccions_id")->constrained("transaccions")->onDelete("restrict");//evito eleiminarcargo_id
            $table->foreignId("cuenta_bancarias_id")->constrained("cuenta_bancarias")->onDelete("restrict");//evito eleiminarcargo_id
            $table->string("numero_voucher", 25);
            $table->string("foto_voucher_pago", 250);            
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
        Schema::dropIfExists('transaccion_cuenta_bancarias');
    }
};
