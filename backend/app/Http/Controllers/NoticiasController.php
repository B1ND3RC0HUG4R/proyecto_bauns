<?php

namespace App\Http\Controllers;

use App\Models\Noticias;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class NoticiasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $news = Noticias::all();
        return response($news);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $news_v = Validator::make($request->all(), [
            'titulo' => 'required|string',
            'src' => 'required',
            'descripcion' => 'required|string|min:20|max:100',
            'activo' => 'required',
            'departamento_id' => 'required|string',
            'user_id' => 'required'
        ]);

        if ($news_v->fails()) {
            return response()->json($news_v->errors()->toJson(), 400);
        }

        $carpeta = "img";
        $files = $request->file('src');
        $nombre_archivo = $files->getClientOriginalName();

        Storage::disk('ftp')->put($carpeta.'/'.$nombre_archivo.'/', \File::get($files));
        $db_save = $request->all();
        $db_save['src'] = $nombre_archivo;
        $new = Noticias::create($db_save);


        return response()->json([
            'message' => 'Noticia creada correctamente',
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
        $new = Noticias::findOrFail($id);
        return response($new);
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
        Noticias::findOrFail($id)->update($request->all());
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
        Noticias::destroy($id);
        return response()->json([
            "message" => "Registro Eliminado"
        ], 201);
    }
}
