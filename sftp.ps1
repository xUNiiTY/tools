# Load WinSCP .NET assembly
# Download WinSCP .NET assembly from https://winscp.net/eng/downloads.php
# Documentation: https://winscp.net/eng/docs/library#classes
# Get Fingerprint from Host ssh-keyscan | ssh-keygen -lf - (ED25519)
# Autofill $sessionOptions Script generator WinScp -> Tabs -> Generate SessionURL / Code -> Powershell



Add-Type -Path ".\WinSCPnet.dll"

# Set up session options
$sessionOptions = New-Object WinSCP.SessionOptions -Property @{
    Protocol = [WinSCP.Protocol]::Sftp
    HostName = "<PlaceHolder>"
    UserName = "<PlaceHolder>"
    Password = "<PlaceHolder>"
    SshHostKeyFingerprint = "ssh-ed25519 255 <PlaceHolder>"
}

function log($message, $fileName) {
    $logFilePath = "log.txt"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message - $fileName" | Out-File -FilePath $logFilePath -Append
}


$session = New-Object WinSCP.Session

try
{
    # Connect
    $session.Open($sessionOptions)

    # Upload every file in the current directory
    foreach ($item in Get-ChildItem) {
        $transferResault = $session.PutFiles(".\" + $item.Name, "C:/Users/Administrator/Desktop/test/" + $item.Name, $false, $transferOptions)

        if ($transferResault.IsSuccess)
        {
            Write-Host "Upload erfolgreich"
            log ("Upload erfolgreich", $item.Name)
        }
        else
        {
            Write-Host "Upload fehlgeschlagen"
            log ("Upload fehlgeschlagen", $item.Name)
        }
    }
}
catch {
    Write-Host "Fehler: $_"
    log ("Fehler: $_", "ERROR CATCH")
}
finally
{
    $session.Dispose()
}