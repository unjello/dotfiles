# install Scoop for development tools
Invoke-Expression (New-Object Net.WebClient).DownloadString('https://get.scoop.sh')

# install Chocolatey for tools not found in Scoop
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

scoop install git cmder-full
scoop install openssh
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')
scoop bucket add extras
scoop install extras/totalcommander
scoop install extras/anaconda3