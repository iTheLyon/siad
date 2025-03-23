<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CanalComunicacion extends Model
{
    use HasFactory;
    protected $table = "canal_comunicacions";

    protected $fillable = [
        'nombre', 
        'url_referencia', 
        'tipo_canal_comunicacions_id',
        'estado', 
        'usuario_registro', 
        'usuario_modificacion'
    ];

    public function tipoCanal()
    {
        return $this->belongsTo(TipoCanalComunicacion::class, 'tipo_canal_comunicacions_id');
    }
}
