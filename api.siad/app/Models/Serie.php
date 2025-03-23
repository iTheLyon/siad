<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Serie extends Model
{
    use HasFactory;
    protected $table = "series";
    protected $fillable = [
        'tipo_documentos_id', 
        'serie_documento', 
        'ultimo_numero', 
        'locals_id', 
        'estado', 
        'usuario_registro', 
        'usuario_modificacion'
    ];
}
