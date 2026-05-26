<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\mahasiswaController;

Route::get('/', function () {
    return view('mahasiswa');
});

Route::get('/mahasiswa', [mahasiswaController::class, 'getDataMahasiswa']);