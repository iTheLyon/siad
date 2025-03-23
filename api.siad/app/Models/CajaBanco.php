<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CajaBanco extends Model
{
    use HasFactory;
    protected $table = "caja_bancos";
    protected $fillable = [
        'nombre', 
        'tipo', 
        'estado', 
        'usuario_registro', 
        'usuario_modificacion'
    ];
}
