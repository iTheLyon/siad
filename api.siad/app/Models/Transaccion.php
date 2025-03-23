<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaccion extends Model
{
    use HasFactory;
    protected $table = 'transaccions'; // Nombre real de la tabla
    protected $fillable = [
        'tipo_transaccions_id',
        'cuenta_clientes_id',
        'clientes_id',
        'caja_bancos_id',
        'empleados_id',
        'locals_id',
        'canal_comunicacions_id',
        'tipo_documentos_id',
        'serie_documento', 
        'numero_documento', 
        'fecha_emision', 
        'hora_emision',
        'medio_pagos_id', 
        'monedas_id', 
        'tipo_cambio', 
        'monto_ingreso',
        'monto_egreso',
        'monto',
        'estado', 
        'usuario_registro', 
        'usuario_modificacion'
    ];

     // Relación con Tipo de Transacción
     public function tipoTransaccion()
     {
         return $this->belongsTo(TipoTransaccion::class, 'tipo_transaccions_id');
     }
 
     // Relación con Cliente
     public function cliente()
     {
         return $this->belongsTo(Cliente::class, 'clientes_id');
     }
 
     // Relación con CuentaCliente
     public function cuentaCliente()
     {
         return $this->belongsTo(CuentaCliente::class, 'cuenta_clientes_id');
     }
 
     // Relación con Medio de Pago
     public function medioPago()
     {
         return $this->belongsTo(MedioPago::class, 'medio_pagos_id');
     }
 
     // Relación con Moneda
     public function moneda()
     {
         return $this->belongsTo(Moneda::class, 'monedas_id');
     }
 
     // Relación con Local
     public function local()
     {
         return $this->belongsTo(Local::class, 'locals_id');
     }
 
     // Relación con Canal de Comunicación
     public function canalComunicacion()
     {
         return $this->belongsTo(CanalComunicacion::class, 'canal_comunicacions_id');
     }
 
     // Relación con Tipo de Documento
     public function tipoDocumento()
     {
         return $this->belongsTo(TipoDocumento::class, 'tipo_documentos_id');
     }
 
     // Relación con CajaBancos (puede ser nula)
     public function cajaBanco()
     {
         return $this->belongsTo(CajaBanco::class, 'caja_bancos_id');
     }
 
     // Relación con Empleado (puede ser nula)
     public function empleado()
     {
         return $this->belongsTo(Empleado::class, 'empleados_id');
     }
 
     // Relación con TransacciónCuentaBancaria (si la transacción tiene una cuenta bancaria vinculada)
     public function transaccionCuentaBancaria()
     {
         return $this->hasOne(TransaccionCuentaBancaria::class, 'transaccions_id');
     }
}
