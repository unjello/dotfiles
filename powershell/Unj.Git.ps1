# Copyright (c) Andrzej Lichnerowicz. All rights reserved.
# Licensed under the MIT License. See README.md in the project root folder for license information.

# following aliases are by default bind bo windows commands, but I need them for git:
# gcm -> Get-Command
Del alias:gcm -Force
# gl -> Get-Location
Del alias:gl -Force
# gp -> Get-Property
Del alias:gp -Force

Function Unj-GitStatus { & git status }
Function Unj-GitAdd { & git add $args }
Function Unj-GitCommit { & git commit -m $args }
Function Unj-GitRemote { & git remote $args }
Function Unj-GitRemoteVerbose { & git remote --verbose  $args }
Function Unj-GitRemoteAdd { & git remote add  $args }
Function Unj-GitRemoteRemove { & git remote rm  $args }
Function Unj-GitSubmodule { & git submodule  $args }
Function Unj-GitSubmoduleAdd { & git submodule add $args }
Function Unj-GitSubmoduleInit { & git submodule init $args }
Function Unj-GitSubmoduleUpdate { & git submodule update --init --recursive }
Function Unj-GitLog1 { & git log --topo-order --pretty=format:"%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B" }
Function Unj-GitLog2 { & git log --topo-order --stat --pretty=format:"%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B" }
Function Unj-GitLog3 { & git log --topo-order --stat --patch --full-diff --pretty=format:"%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B" }
Function Unj-GitLog4 { & git log --topo-order --pretty=format:"%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n" }
Function Unj-GitLog5 { & git log --topo-order --all --graph --pretty=format:"%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n" }
Function Unj-GitLog6 { & git log --topo-order --pretty=format:"%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n" }
Function Unj-GitLog7 { & git shortlog --summary --numbered }
Function Unj-GitPush { & git push }
Function Unj-GitPushForce { & git push --force }
Function Unj-GitPushAll { & git push --all }
Function Unj-GitPushAllAndTags { & git push --all; & git push --tags }
Function Unj-GitPushTags { & git push --tags }

Set-Alias -Name gws -Value Unj-GitStatus
Set-Alias -Name gia -Value Unj-GitAdd
Set-Alias -Name gcm -Value Unj-GitCommit
Set-Alias -Name gR -Value Unj-GitRemote
Set-Alias -Name gRl -Value Unj-GitRemoteVerbose
Set-Alias -Name gRa -Value Unj-GitRemoteAdd
Set-Alias -Name gRx -Value Unj-GitRemoteRemove
Set-Alias -Name gS -Value Unj-GitSubmodule
Set-Alias -Name gSa -Value Unj-GitSubmoduleAdd
Set-Alias -Name gSi -Value Unj-GitSubmoduleInit
Set-Alias -Name gSI -Value Unj-GitSubmoduleUpdate
Set-Alias -Name gl -Value Unj-GitLog1
Set-Alias -Name gls -Value Unj-GitLog2
Set-Alias -Name gld -Value Unj-GitLog3
Set-Alias -Name glo -Value Unj-GitLog4
Set-Alias -Name glg -Value Unj-GitLog5
Set-Alias -Name glb -Value Unj-GitLog6
Set-Alias -Name glc -Value Unj-GitLog7
Set-Alias -Name gp -Value Unj-GitPush
Set-Alias -Name gpf -Value Unj-GitPushForce
Set-Alias -Name gpa -Value Unj-GitPushAll
Set-Alias -Name gpA -Value Unj-GitPushAllAndTags
Set-Alias -Name gpt -Value Unj-GitPushTags