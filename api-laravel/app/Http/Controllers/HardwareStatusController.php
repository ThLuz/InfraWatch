<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class HardwareStatusController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'cpu' => 'required|numeric',
            'cpu_temp' => 'nullable|string',
            'memory.total' => 'required|numeric',
            'memory.used' => 'required|numeric',
            'disk' => 'required|numeric',
            'disk_total' => 'nullable|string',
            'disk_used' => 'nullable|string',
        ]);

        Cache::put('hardware_status', $validated, now()->addMinutes(2));

        return response()->json([
            'message' => 'Status recebido com sucesso',
            'data' => $validated
        ]);
    }

    public function show()
    {
        $data = Cache::get('hardware_status');

        if (!$data) {
            return response()->json(['message' => 'Nenhum dado encontrado'], 404);
        }

        return response()->json(['data' => $data]);
    }
}
