#PW Manager for Scripts
#Install-Module -Name CredentialManager -Scope CurrentUser -Force

Import-Module CredentialManager


#$Files = Get-ChildItem -Filter *recommended_orders_*
#
#
#foreach ($File in $Files) {
#    Write-Host $File "<--- yadadadad"
#    Move-Item $File .\Archiv
#}

$Credentials = Get-StoredCredential -Target "test"

$user = $Credentials.UserName
$pw = $Credentials.GetNetworkCredential().Password

Write-Host $user $pw