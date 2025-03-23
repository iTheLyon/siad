<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    use HasFactory;

    protected $table = "clientes";
    protected $fillable = [
        'player_id',
        'dni',
        'nombres',
        'apellidos',
        'email',
        'whatsapp',
        'direccion',
        'celular',
        'genero',
        'fecha_nacimiento',
        'caja_bancos_id',
        'numero_cuenta_bancaria',
        'cci_cuenta_bancaria',
        'estado',
        'usuario_registro',
        'usuario_modificacion'
    ];


    public function cajaBanco()
    {
        return $this->belongsTo(CajaBanco::class, 'caja_bancos_id');
    }
    
}
