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


Set-Alias -Name which -Value Get-Command

# gcm is by default bound to Get-Command, but I need it for Git
Del alias:gcm -Force

Function Unj-GitStatus { & git status }
Function Unj-GitAdd { & git add $args }
Function Unj-GitCommit { & git commit -m $args }
Set-Alias -Name gws -Value Unj-GitStatus
Set-Alias -Name gia -Value Unj-GitAdd
Set-Alias -Name gcm -Value Unj-GitCommit