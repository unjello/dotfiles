New-Item -ItemType Directory -Force -Path $env:HOMEPATH\Documents\WindowsPowerShell | Out-Null
Copy-Item windows\ps\*.ps1 $env:HOMEPATH\Documents\WindowsPowerShell