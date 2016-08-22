# http://martin.hoppenheit.info/blog/2015/using-powershell-behind-proxy/

(New-Object System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

Write-Host "Copying PowerShell Profile and user scripts"
New-Item -ItemType Directory -Force -Path $env:HOMEDRIVE\$env:HOMEPATH\Documents\WindowsPowerShell | Out-Null
Copy-Item windows\ps\*.ps1 $env:HOMEDRIVE\$env:HOMEPATH\Documents\WindowsPowerShell
Write-Host

Write-Host "Installing Chocolatey"
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host

Write-Host "Installing applications from Chocolatey"
cinst powershell -y
cinst git -y
cinst putty -y
cinst poshgit -y
Write-Host
