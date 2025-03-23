<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cliente;
use App\Models\CuentaCliente;
class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {        
        $clientes = Cliente::where('estado','1')->get();

        foreach ($clientes as $cliente) {            
            $cuentaCliente = CuentaCliente::where('cliente_id', $cliente->id)
            ->where('tipo', 1)
            ->first();

            $cliente->saldo = $cuentaCliente->saldo;
        }
        return response()->json($clientes);
    }

    public function buscarPorPlayerId($player_id)
    {
        $cliente = Cliente::where('player_id', $player_id)->first();
        return $cliente ? response()->json($cliente) : response()->json(["error" => "Cliente no encontrado"], 404);
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
