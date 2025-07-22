<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;

class HardwareStatusController extends Controller
{
    public function status(): JsonResponse
    {
        $osFamily = PHP_OS_FAMILY;

        if ($osFamily === 'Windows') {
            $scriptPath = base_path('../scripts/hardware_status.ps1');
            if (!file_exists($scriptPath)) {
                return response()->json(['error' => 'Script PowerShell não encontrado'], 404);
            }
            $command = "powershell -NoProfile -ExecutionPolicy Bypass -File \"$scriptPath\"";
        } elseif (in_array($osFamily, ['Linux', 'Darwin'])) {
            $scriptPath = base_path('../scripts/hardware_status.sh');
            if (!file_exists($scriptPath)) {
                return response()->json(['error' => 'Script Shell não encontrado'], 404);
            }
            $command = "bash \"$scriptPath\"";
        } else {
            return response()->json(['error' => "SO não suportado: $osFamily"], 400);
        }

        exec($command, $output, $returnVar);

        if ($returnVar !== 0) {
            return response()->json(['error' => 'Erro ao executar o script'], 500);
        }

        $jsonOutput = implode("\n", $output);
        $data = json_decode($jsonOutput, true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            return response()->json(['error' => 'JSON inválido do script', 'raw' => $jsonOutput], 500);
        }

        return response()->json(['hardware_status' => $data]);
    }
}
