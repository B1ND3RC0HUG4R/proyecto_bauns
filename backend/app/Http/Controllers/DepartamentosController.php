<?php

namespace App\Http\Controllers;

use App\Models\Departamento;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DepartamentosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dptos = Departamento::all();
        return response($dptos);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $dpto_v = Validator::make($request->all(),[
            'departamento' => 'required|string',
            'descripcion' => 'required|string',
            'activo' => 'required'
        ]);

        if($dpto_v->fails()){
            return response()->json($dpto_v->errors()->toJson(), 400);
        }

        $new = Departamento::create($request->all());

        return response()->json([
            'message' => 'Departamento creado correctamente',
            'img' => $new
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $rol = Departamento::findOrFail($id);
        return response($rol);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        Departamento::findOrFail($id)->update($request->all());
        return response()->json([
            "message" => "Registro Modificado"
        ], 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        Departamento::destroy($id);
        return response()->json([
            "message" => "Registro Eliminado"
        ], 201);
    }
}
