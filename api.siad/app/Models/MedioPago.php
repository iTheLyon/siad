<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MedioPago extends Model
{
    use HasFactory;
    protected $table = "medio_pagos";

    protected $fillable = [
        'nombre', 
        'alias', 
        'monto_minimo', 
        'monto_maximo', 
        'estado', 
        'usuario_registro', 
        'usuario_modificacion'
    ];
}
