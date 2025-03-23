<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    use HasFactory;
    protected $table = "empleados";
    protected $fillable = [
        'dni',
        'nombres',
        'apellidos',        
        'cargo_id',
        'sueldo',
        'estado',
        'usuario_registro',
        'usuario_modificacion'
    ];
}
