# Load WinSCP .NET assembly
Add-Type -Path ".\WinSCPnet.dll"

# Set up session options
$sessionOptions = New-Object WinSCP.SessionOptions -Property @{
    Protocol = [WinSCP.Protocol]::Sftp
    HostName = "<PlaceHolder>"
    UserName = "<PlaceHolder>"
    Password = "<PlaceHolder>"
    SshHostKeyFingerprint = "ssh-ed25519 255 <PlaceHolder>"
}

function log($message) {
    $logFilePath = "log.txt"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $logFilePath -Append
}


$session = New-Object WinSCP.Session

try
{
    # Connect
    $session.Open($sessionOptions)


    foreach ($item in Get-ChildItem) {
        $transferResault = $session.PutFiles(".\" + $item.Name, "C:/Users/Administrator/Desktop/test/" + $item.Name, $false, $transferOptions)

        if ($transferResault.IsSuccess)
        {
            Write-Host "Upload erfolgreich"
            log "Upload erfolgreich"
        }
        else
        {
            Write-Host "Upload fehlgeschlagen"
            log "Upload fehlgeschlagen"
        }
    }












}
catch {
    Write-Host "Fehler: $_"
}
finally
{
    $session.Dispose()
}
