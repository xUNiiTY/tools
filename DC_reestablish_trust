Reset-ComputerMachinePassword -Server MyDC -Credential contoso\admin

#Returns $true if operation is successful
Test-ComputerSecureChannel -Repair -Server MyDC -Credential contoso\admin

#Alternative
netdom.exe resetpwd /s:MyDC /ud:contoso\admin /pd:*
