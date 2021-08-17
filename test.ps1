Write-Host "Running Test..."
Write-Host "Running Task: $($args[0])"
.\bin\LoginPI.Logon.exe https://demolab.loginvsi.com:8081 "MK Ultra"
Write-Host "Test Complete."
