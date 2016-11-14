# Copyright (c) Andrzej Lichnerowicz. All rights reserved.
# Licensed under the MIT License. See README.md in the project root folder for license information.

function Move-iPhotosMasters($Source, $Year, $Month, $Target) {
    $src = Join-Path -Path $Source -ChildPath $Year -AdditionalChildPath $Month
    $folder = "{0}.{1} -- Zrzut iPhone" -f $Year, $Month
    $dst = Join-Path -Path $Target -ChildPath $Year -AdditionalChildPath $folder

    New-Item -Path $dst -ItemType Directory -Force | Out-Null
    Get-ChildItem -Path $src -Recurse -Include *.nef,*.mov,*.jpg,*.png,*.aae,*.jpeg,*.mp4 | % { Move-Item $_.FullName -Destination $dst }
}