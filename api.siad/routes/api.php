<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TransaccionController;
use App\Http\Controllers\CanalComunicacionController;
use App\Http\Controllers\MedioPagoController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\UploadController;
use App\Http\Controllers\CajaBancoController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('v1')->group(function () {
    Route::post('/transacciones', [TransaccionController::class, 'store']);        
    Route::apiResource('canales-comunicacion', CanalComunicacionController::class);
    Route::apiResource('medios-pago', MedioPagoController::class);
    Route::apiResource('clientes', ClienteController::class);
    Route::get('clientes/player/{player_id}', [ClienteController::class, 'buscarPorPlayerId']);
    Route::get('clientes/{cliente_id}/ultima-recarga', [TransaccionController::class, 'ultimaRecarga']);
    Route::post('upload', [UploadController::class, 'uploadImage']);
    Route::get('caja-bancos/tipo/{tipo}', [CajaBancoController::class, 'getByTipo']);
    Route::get('/clientes/{cliente_id}/transacciones', [TransaccionController::class, 'getTransaccionesPorCliente']);

});