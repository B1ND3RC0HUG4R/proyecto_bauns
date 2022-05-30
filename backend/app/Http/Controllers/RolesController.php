<?php

namespace App\Http\Controllers;

use App\Models\Roles;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class RolesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $roles = Roles::all();
        return response($roles);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $rol_v = Validator::make($request->all(),[
            'rol' => 'required|string',
            'descripcion' => 'required|string',
            'activo' => 'required'
        ]);

        if($rol_v->fails()){
            return response()->json($rol_v->errors()->toJson(), 400);
        }

        $new = Roles::create($request->all());

        return response()->json([
            'message' => 'Rol creado correctamente',
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
        $rol = Roles::findOrFail($id);
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
        Roles::findOrFail($id)->update($request->all());
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
        Roles::destroy($id);
        return response()->json([
            "message" => "Registro Eliminado"
        ], 201);
    }
}
