# install Scoop for development tools
Invoke-Expression (New-Object Net.WebClient).DownloadString('https://get.scoop.sh')

# install Chocolatey for tools not found in Scoop
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
