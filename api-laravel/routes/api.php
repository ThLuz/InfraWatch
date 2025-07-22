<?php 

use App\Http\Controllers\HardwareStatusController;
use Illuminate\Support\Facades\Route;

Route::post('/hardware/status', [HardwareStatusController::class, 'store']);
Route::get('/hardware/status', [HardwareStatusController::class, 'show']);
