Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
$env:path += ";" + $env:HOMEPATH + "\Documents\WindowsPowerShell\"

# Load PoshGit


Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
Import-Module posh-git
. .\Unj.Prompt.Collapsed.ps1

. .\Other.Sudo.ps1
. .\Unj.Git.ps1
. .\Unj.iPhotos_helpers.ps1

if (Test-Path Work.ps1) { . .\Work.ps1 }

Pop-Location
Start-SshAgent -Quiet

Set-Alias -Name which -Value Get-Command

Function Unj-VBoxManage { & $env:ProgramFiles\Oracle\VirtualBox\VBoxManage.exe $args }
Function Unj-VBoxListVms { Unj-VBoxManage list vms }
Function Unj-VBoxListRunningVms { Unj-VBoxManage list runningvms }
Function Unj-VBoxModifyVm { Unj-VBoxManage modifyvm @args }
Function Unj-VBoxControlVm { Unj-VBoxManage controlvm @args }
Set-Alias -Name vbm -Value Unj-VBoxManage
Set-Alias -Name vlv -Value Unj-VBoxListVms
Set-Alias -Name vlrv -Value Unj-VBoxListRunningVms
Set-Alias -Name vmv -Value Unj-VBoxModifyVm
Set-Alias -Name vcv -Value Unj-VBoxControlVm

Function Unj-VBoxChangeRunningVmsToBridged {
    Unj-VBoxListRunningVms | % {
        $guid = $_.Split("{")[1];
        Unj-VBoxControlVm ($guid -replace ".$") nic1 bridged "Intel(R) Ethernet Connection I217-LM"
    }
}
Function Unj-VBoxChangeVmsToBridged {
    Unj-VBoxListVms | % {
        $guid = $_.Split("{")[1];
        Unj-VBoxModifyVm ($guid -replace ".$") --nic1 bridged "Intel(R) Ethernet Connection I217-LM"
    }
}
Set-Alias -Name vmbridged -Value Unj-VBoxChangeVmsToBridged
Set-Alias -Name vmrbridged -Value Unj-VBoxChangeRunningVmsToBridged
Function Unj-VBoxChangeRunningVmsToNat {
    Unj-VBoxListRunningVms | % {
        $guid = $_.Split("{")[1];
        Unj-VBoxControlVm ($guid -replace ".$") nic1 nat
    }
}
Function Unj-VBoxChangeVmsToNat {
    Unj-VBoxListVms | % {
        $guid = $_.Split("{")[1];
        Unj-VBoxModifyVm ($guid -replace ".$") --nic1 nat
    }
}
Set-Alias -Name vmnat -Value Unj-VBoxChangeVmsToNat
Set-Alias -Name vmrnat -Value Unj-VBoxChangeRunningVmsToNat
