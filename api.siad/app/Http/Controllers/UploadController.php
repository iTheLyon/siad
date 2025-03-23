<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UploadController extends Controller
{
    public function uploadImage(Request $request)
    {
        // validnado una imagen y tenga un tamaño máximo de 2MB
        $request->validate([
            'file' => 'required|image|mimes:jpg,jpeg,png,gif|max:2048',
        ]);

        //Guardando la imagen en storage/app/public/uploads/
        $path = $request->file('file')->store('uploads', 'public');

        // Devolver la URL pública de la imagen
        return response()->json([
            'message' => 'Imagen subida exitosamente',
            'filePath' => asset("storage/{$path}")
        ]);
    }
}
