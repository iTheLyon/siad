<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CuentaCliente extends Model
{
    use HasFactory;

    protected $table = "cuenta_clientes";
    protected $fillable = [
        'cliente_id',
        'denominacion',
        'tipo',
        'saldo',
        'fecha_caducidad',
        'estado',
        'usuario_registro',
        'usuario_modificacion'
    ];
}
