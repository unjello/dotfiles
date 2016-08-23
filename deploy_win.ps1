# &copy;2016;-0xaL;
# some snippets from or inspired by:
# http://martin.hoppenheit.info/blog/2015/using-powershell-behind-proxy/
# https://gist.github.com/vintem/6334646

Function Install-Confirm {
    [CmdletBinding()]Param(
      [parameter(Mandatory=$True,ValueFromPipeline=$True,Position=0)][string]$Application
    )

    Write-Host
    do {
        $yn = Read-Host "Do you want to install $Application (Y/N)"
    } while ($yn -ne "Y" -and $yn -ne "N")
    if ($yn -eq "Y") {
        Write-Verbose "Installing $Application"
       cinst $Application -y
    }
    Write-Host
}

(New-Object System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

# copy profile first, so chocolatey applications can update it (e.g. poshgit does).
Write-Host "Copying PowerShell Profile and user scripts"
New-Item -ItemType Directory -Force -Path $env:HOMEDRIVE\$env:HOMEPATH\Documents\WindowsPowerShell | Out-Null
Copy-Item windows\ps\*.ps1 $env:HOMEDRIVE\$env:HOMEPATH\Documents\WindowsPowerShell
Write-Host

Write-Host "Installing Chocolatey"
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host

Write-Host "Installing applications from Chocolatey"
# essentials
cinst powershell -y
cinst git -y
cinst putty -y
cinst poshgit -y
cinst emacs -y
cinst autohotkey.portable -y
cinst 7zip -y
cinst dotnet3.5 -y
cinst dotnet4.5 -y
# languages
cinst strawberryperl -y
cinst python -y
cinst ruby -y
cinst nodejs.install -y
cinst maven --version 3.3.9 -y
# ides
cinst atom -y
cinst brackets -y
cinst visualstudiocode -y
cinst r.studio -y
# tools
cinst googlechrome -y
cinst fiddler -y
cinst virtualbox -y
cinst nsis -y
cinst wireshark -y
cinst rawcap -y
cinst tortoisesvn -y
cinst kdiff3 -y
cinst xmind -y
cinst xmlnotepad -y
cinst curl -y
cinst winscp -y
cinst notepadplusplus.install -y
cinst linqpad4 -y
cinst NuGet.CommandLine -y
cinst paint.net -y
cinst vim -y
cinst snoop -y
cinst gpg4win -y
cinst github -y
Write-Host

Install-Confirm cygwin
Install-Confirm intellijidea-ultimate
Install-Confirm redis-64
Install-Confirm radmin.viewer

Write-Host "Copying Emacs configuration"
New-Item -ItemType Directory -Force -Path $env:HOMEDRIVE\$env:HOMEPATH\.emacs.d | Out-Null
Copy-Item -Recurse dot\emacs.d\* $env:HOMEDRIVE\$env:HOMEPATH\.emacs.d
Write-Host

