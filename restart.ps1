Kill -ProcessName node -ErrorAction SilentlyContinue
$p = Start-Process -PassThru -FilePath 'node.exe' -ArgumentList 'C:\Users\Administrator\Documents\dr aqsa\server.js' -WorkingDirectory 'C:\Users\Administrator\Documents\dr aqsa' -WindowStyle Hidden
Start-Sleep -Seconds 3
try {
    $r = Invoke-WebRequest -Uri 'http://localhost:3000' -UseBasicParsing -TimeoutSec 6
    Write-Output "HTTP " + $r.StatusCode
} catch {
    Write-Output "FAILED: " + $_.Exception.Message
}