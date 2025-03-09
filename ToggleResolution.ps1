# Set paths
$qresPath = "C:\Users\Cypher\Documents\Scripts\QRes.exe"
$logDir = "C:\Users\Cypher\Documents\Scripts\logs"
$logFile = "$logDir\ResolutionChange.log"

# Ensure logs directory exists
if (-Not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

# Function to log and display output
function Write-Log {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"
    
    # Show output in PowerShell
    Write-Host $logEntry -ForegroundColor Cyan
    
    # Write output to log file
    Add-Content -Path $logFile -Value $logEntry
}

# Check if QRes exists
if (-Not (Test-Path $qresPath)) {
    Write-Log "ERROR: QRes.exe not found! Make sure it's in C:\Users\Cypher\Documents\Scripts"
    exit
}

Write-Log "Starting resolution switch process..."

# Get current screen resolution
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class ScreenResolution {
    [DllImport("user32.dll")]
    public static extern int GetSystemMetrics(int nIndex);
}
"@ -Language CSharp

$currentWidth = [ScreenResolution]::GetSystemMetrics(0)  # SM_CXSCREEN (Screen Width)
$currentHeight = [ScreenResolution]::GetSystemMetrics(1) # SM_CYSCREEN (Screen Height)

Write-Log "Current detected resolution: ${currentWidth}x${currentHeight}"

# Toggle between resolutions
if ($currentWidth -eq 1280 -and $currentHeight -eq 960) {
    Write-Log "Detected 1280x960 - Switching to 1920x1080 @ 240Hz"
    Start-Process -FilePath $qresPath -ArgumentList "/x 1920 /y 1080 /r 240" -NoNewWindow -Wait
} else {
    Write-Log "Detected different resolution - Switching to 1280x960 @ 240Hz"
    Start-Process -FilePath $qresPath -ArgumentList "/x 1280 /y 960 /r 240" -NoNewWindow -Wait
}

# Wait briefly for the resolution to apply
Write-Log "Waiting 2 seconds for resolution to apply..."
Start-Sleep -Seconds 2

# Verify if the resolution changed successfully
$newWidth = [ScreenResolution]::GetSystemMetrics(0)
$newHeight = [ScreenResolution]::GetSystemMetrics(1)

if ($newWidth -eq 1280 -and $newHeight -eq 960) {
    Write-Log "SUCCESS: Resolution successfully changed to 1280x960 @ 240Hz"
} elseif ($newWidth -eq 1920 -and $newHeight -eq 1080) {
    Write-Log "SUCCESS: Resolution successfully changed to 1920x1080 @ 240Hz"
} else {
    Write-Log "ERROR: Unexpected resolution detected after change: ${newWidth}x${newHeight}"
}

Write-Log "Resolution switch process completed."
