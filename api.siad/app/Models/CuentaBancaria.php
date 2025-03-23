<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CuentaBancaria extends Model
{
    use HasFactory;
    protected $table = "cuenta_bancarias";
    protected $fillable = [
        'caja_bancos_id',
        'numero_cuenta', 
        'cci', 
        'tipo', 
        'estado', 
        'usuario_registro', 
        'usuario_modificacion'
    ];
}
