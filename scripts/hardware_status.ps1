# CPU via typeperf
$cpuLine = & cmd /c "typeperf ""\Processor(_Total)\% Processor Time"" -sc 1" | Select-Object -Index 2
$cpuValue = $cpuLine -split ',' | Select-Object -Last 1
$cpuUsage = [math]::Round([double]($cpuValue.Trim('"')), 2)

# Memória
$mem = Get-CimInstance -ClassName Win32_OperatingSystem
$memTotal = [math]::Round($mem.TotalVisibleMemorySize / 1024, 2)
$memFree = [math]::Round($mem.FreePhysicalMemory / 1024, 2)
$memUsed = $memTotal - $memFree

# Disco
$disk = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'"
$diskTotal = [math]::Round($disk.Size / 1GB, 2)
$diskFree = [math]::Round($disk.FreeSpace / 1GB, 2)
$diskUsed = $diskTotal - $diskFree

# Resultado final
$result = [PSCustomObject]@{
    cpu_usage_percent = $cpuUsage
    memory_total_mb = $memTotal * 1024
    memory_used_mb = $memUsed * 1024
    disk_used_percent = [math]::Round(($diskUsed / $diskTotal) * 100, 2)
}

$result | ConvertTo-Json
