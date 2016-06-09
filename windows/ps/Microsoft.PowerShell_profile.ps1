Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
$env:path += ";" + $env:HOMEPATH + "\Documents\WindowsPowerShell\"

# Load PoshGit
Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
Import-Module posh-git
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    Write-Host($pwd.ProviderPath) -nonewline
    Write-VcsStatus
    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}
Pop-Location
Start-SshAgent -Quiet
