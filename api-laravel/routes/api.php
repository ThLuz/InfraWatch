<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HardwareStatusController;

Route::middleware('api')->group(function () {
    Route::get('/hardware/status', [HardwareStatusController::class, 'status']);
});
