<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Log; // Importar Log
use Illuminate\Http\Request;
use App\Models\Transaccion;
use App\Models\CuentaCliente;
use App\Models\Empleado;
use App\Models\Local;
use App\Models\Serie;
use App\Models\TransaccionCuentaBancaria;
use App\Models\CajaBanco;
use App\Models\CuentaBancaria;
use Carbon\Carbon;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB;

class TransaccionController extends Controller
{
    public function store(Request $request)
    {
        try {
            DB::beginTransaction(); // Iniciar transacción de base de datos

            $validated = $request->validate([
                'tipo_transaccion_id' => 'required|exists:tipo_transaccions,id',
                'cliente_id' => 'required|exists:clientes,id',
                'caja_bancos_id' => 'required|exists:caja_bancos,id',
                'canal_comunicacions_id' => 'required|exists:canal_comunicacions,id',                
                'medio_pagos_id' => 'required|exists:medio_pagos,id',
                'moneda_id' => 'required|exists:monedas,id',
                'tipo_cambio' => 'required|numeric',                
                'monto' => 'required|numeric',
                'monto_ingreso' => 'required|numeric',
                'monto_egreso' => 'required|numeric'
            ]);

            // Obtener cuenta_clientes_id automáticamente (cliente + tipo = 1)
            $cuentaCliente = CuentaCliente::where('cliente_id', $validated['cliente_id'])
            ->where('tipo', 1)
            ->first();

            if (!$cuentaCliente) {
                return response()->json(["message" => "Cuenta de cliente no encontrada"], 404);
            }

            // Obtener empleado si se envió empleados_id            
            $empleado = Empleado::find(1);
            if (!$empleado) {
                return response()->json(["message" => "Empleado no encontrado"], 404);
            }            

            // Obtener local si se envió locals_id
            $local = Local::find(1);
            if (!$local) {
                return response()->json(["message" => "Local no encontrado"], 404);
            }
          
            // Obtener la primera serie de tipo_documento_id
            $serie = Serie::where('tipo_documentos_id', 1)->first();
            if (!$serie) {
                return response()->json(["message" => "Serie no encontrada para el tipo de documento"], 404);
            }
            
            $fechaEmision = Carbon::now()->toDateString(); // YYYY-MM-DD
            $horaEmision = Carbon::now()->toTimeString(); // HH:MM:SS
            $usuario_registro='admin';
            // Manejo de la imagen del voucher
            
            $fotoVoucherPath = $request->foto_voucher_pago;
            

           // Crear la transacción con los datos obtenidos automáticamente
            $transaccion = Transaccion::create([
                'tipo_transaccions_id' => $validated['tipo_transaccion_id'],
                'cuenta_clientes_id' => $cuentaCliente->id,
                'clientes_id' => $validated['cliente_id'],
                'caja_bancos_id' => $request->caja_bancos_id,
                'empleados_id' => $empleado ? $empleado->id : null,
                'locals_id' => $local->id,
                'canal_comunicacions_id' => $validated['canal_comunicacions_id'],
                'tipo_documentos_id' => $serie->tipo_documentos_id,
                'serie_documento' => $serie->serie_documento, // Tomamos la primera serie encontrada
                'numero_documento' => $serie->ultimo_numero+1, // Se debe incrementar en lógica futura
                'fecha_emision' => $fechaEmision,
                'hora_emision' => $horaEmision,
                'medio_pagos_id' => $validated['medio_pagos_id'],
                'monedas_id' => $validated['moneda_id'],
                'tipo_cambio' => $validated['tipo_cambio'],
                'monto_ingreso' => $validated['monto_ingreso'],
                'monto_egreso' => $validated['monto_egreso'],
                'monto' => $validated['monto'],
                'estado' => '1',
                'usuario_registro' => $usuario_registro,
                'usuario_modificacion' => "",
            ]);
            
            $cajabanco = CajaBanco::find($validated['caja_bancos_id']);
            if (!$cajabanco) {
                return response()->json(["message" => "CajaBanco no encontrada"], 404);
            }

            if($cajabanco->tipo==2) {
                $cuentabancariadefault=CuentaBancaria::where('caja_bancos_id',$cajabanco->id)->first();
                if (!$cuentabancariadefault) {
                    return response()->json(["message" => "Cuenta Bancaria no encontrada"], 404);
                }
                // Insertar en transaccion_cuenta_bancaria
                $transaccionCuentaBancaria = TransaccionCuentaBancaria::create([
                    'transaccions_id' => $transaccion->id,
                    'cuenta_bancarias_id' => $cuentabancariadefault->id,
                    'numero_voucher' => $request->numero_voucher == null ? "" : $request->numero_voucher,
                    'foto_voucher_pago' => $fotoVoucherPath,
                    'estado' => '1',
                    'usuario_registro' => $usuario_registro,
                    'usuario_modificacion' => "",
                ]);
            }
            
            //actualizar el numero de serie
            $serie->ultimo_numero=$serie->ultimo_numero+1;
            $serie->save();
            //actualizar el saldo de la cuenta
            if($validated['monto_ingreso']>0)
                $cuentaCliente->saldo = $cuentaCliente->saldo + $validated['monto_ingreso'];
            else
                $cuentaCliente->saldo = $cuentaCliente->saldo - $validated['monto_egreso'];
            
            $cuentaCliente->save();

            DB::commit(); // Confirmar transacción en BD

            //
            $this->notificarCambioSaldo($validated['cliente_id'], $cuentaCliente->saldo);

            return response()->json([
                'message' => 'Transacción registrada con éxito',
                'transaccion' => $transaccion
            ], 201);

        } catch (ValidationException $e) {
            DB::rollBack();
            Log::error("Error de validación en store(): ", $e->errors()); // Guardar errores de validación
            return response()->json([
                'message' => 'Error de validación',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error("Error en store(): " . $e->getMessage(), ['trace' => $e->getTraceAsString()]); // Guardar error en logs

            return response()->json([
                'message' => 'Error interno',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function ultimaTransaccion($cliente_id,$tipo_transaccion_id,$message="No se encontraron transacciones de este tipo")
    {
        $transaccion = Transaccion::where('clientes_id', $cliente_id)
            ->where('tipo_transaccions_id', $tipo_transaccion_id)
            ->orderBy('created_at', 'desc')
            ->first();

        if (!$transaccion) {
            return response()->json(["message" => $message], 404);
        }

        return response()->json($transaccion);
    }

    public function ultimaRecarga($cliente_id)
    {
        $ID_RECARGA_SALDO=config('constants.TIPO_TRANSACCION_FRECUENTE.RECARGA_SALDO');
        return $this->ultimaTransaccion($cliente_id, $ID_RECARGA_SALDO,"No hay ultima recarga de saldo");
    }

    public function getTransaccionesPorCliente($cliente_id)
    {
        try {
            $transacciones = Transaccion::where('clientes_id', $cliente_id)
                ->with(['tipoTransaccion', 'medioPago', 'moneda', 'cuentaCliente', 'local','cajaBanco'])
                ->orderBy('created_at', 'desc')
                ->get();

            if ($transacciones->isEmpty()) {
                return response()->json([
                    'message' => 'No se encontraron transacciones para este cliente'
                ], 404);
            }

            return response()->json([
                'message' => 'Transacciones obtenidas con éxito',
                'transacciones' => $transacciones
            ], 200);

        } catch (\Exception $e) {
            Log::error("Error al obtener transacciones para clientes_id {$cliente_id}: " . $e->getMessage());
            return response()->json([
                'message' => 'Error interno',
                'error' => $e->getMessage()
            ], 500);
        }
        
    }

    function notificarCambioSaldo($clienteId, $nuevoSaldo) {
        $data = json_encode(["clienteId" => $clienteId, "nuevoSaldo" => $nuevoSaldo]);
        $ch = curl_init("http://localhost:8081/actualizarSaldo");
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
    
        $response = curl_exec($ch);
        $error = curl_error($ch);
    
        curl_close($ch);
    
        if ($error) {
            Log::error("Error al enviar notificación a Node.js: $error");
        } else {
            Log::info("Respuesta del servidor WebSocket: $response");
        }
    }
}
