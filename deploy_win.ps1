New-Item -ItemType Directory -Force -Path $env:HOMEDRIVE\$env:HOMEPATH\Documents\WindowsPowerShell | Out-Null
Copy-Item windows\ps\*.ps1 $env:HOMEDRIVE\$env:HOMEPATH\Documents\WindowsPowerShell
