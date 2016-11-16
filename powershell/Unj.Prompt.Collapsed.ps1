# Copyright (c) Andrzej Lichnerowicz. All rights reserved.
# Licensed under the MIT License. See README.md in the project root folder for license information.

function ShortenPath($path) {
    $pathArray = $path -Split '\\'
    $drive = $pathArray[0]
    $length = $pathArray.Length;
    $current = $pathArray[$length-1]
    $pathArray = $pathArray[1..($length-2)] | % { $_[0] }
    $reduced = $pathArray | % {$r = ''} {$r += ($_ + '\')} {$r}
    $ret = $drive + '\' + $reduced + $current
    $ret
}

# a zsh like prompt, where folders in the middle are represented by first letter only, not entire name.
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    Write-Host(ShortenPath($pwd.ProviderPath)) -nonewline
    Write-VcsStatus
    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}