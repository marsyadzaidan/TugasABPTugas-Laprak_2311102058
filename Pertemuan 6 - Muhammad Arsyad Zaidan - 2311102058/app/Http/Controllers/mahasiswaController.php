<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;

class mahasiswaController extends Controller
{
    public function getDataMahasiswa()
    {
        $datapath = storage_path('app/data/mahasiswa.json');

        if (!File::exists($datapath)) {
            return Response::json([
                'status' => 'error',
                'message' => 'File data mahasiswa tidak ditemukan.'
            ], 404);
        }

        $jsonData = File::get($datapath);
        $arrayData = json_decode($jsonData, true);

        return Response::json($arrayData);
    }
}