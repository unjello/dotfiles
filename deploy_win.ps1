# andrzej lichnerowicz, unlicensed (~public domain)

# Install Visual Studio Code (w/ Insiders) settings
if (Test-Path $env:APPDATA\Code\) {
  Copy-Item -Force vscode/settings.json $env:APPDATA\Code\User\settings.json
  Copy-Item -Force vscode/keybindings.json $env:APPDATA\Code\User\keybindings.json
}
if (Test-Path "${env:APPDATA}\Code - Insiders\") {
  Copy-Item -Force vscode/settings.json "${env:APPDATA}\Code - Insiders\User\settings.json" 
  Copy-Item -Force vscode/keybindings.json "${env:APPDATA}\Code - Insiders\User\keybindings.json"
}