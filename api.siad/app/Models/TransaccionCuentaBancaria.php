<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaccionCuentaBancaria extends Model
{
    use HasFactory;
    protected $table = "transaccion_cuenta_bancarias";
    protected $fillable = [
        'transaccions_id',
        'cuenta_bancarias_id',
        'numero_voucher',
        'foto_voucher_pago',        
        'estado',
        'usuario_registro',
        'usuario_modificacion'
    ];
}
