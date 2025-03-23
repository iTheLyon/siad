<?php

namespace App\Http\Controllers;
use App\Models\CajaBanco;
use Illuminate\Http\Request;

class CajaBancoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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

    public function getByTipo($tipo)
    {
        // Validar que el tipo solo sea 1 o 2
        if (!in_array($tipo, ['1', '2'])) {
            return response()->json(["error" => "Tipo inválido, solo se permite 1 (caja) o 2 (banco)"], 400);
        }

        // Obtener los registros filtrados por tipo y estado activo (1)
        $cajasBancos = CajaBanco::where('tipo', $tipo)
            ->where('estado', '1')
            ->get();

        return response()->json($cajasBancos);
    }
}
