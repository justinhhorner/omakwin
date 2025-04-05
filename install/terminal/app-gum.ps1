# Gum is used for the to tailor Omakwin after the initial install
$TMP_PATH = "$env:TMP\omakwin"
$GUM_VERSION="0.14.3"
$GUM_PATH="gum_${GUM_VERSION}_Windows_x86_64"

if (Test-Path -Path $TMP_PATH\gum.exe) {
    return
} else {
    New-Item -ItemType Directory -Path $TMP_PATH
}

Invoke-WebRequest -Uri "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/${GUM_PATH}.zip" -OutFile "$TMP_PATH\gum.zip"
Expand-Archive -Path "$TMP_PATH\gum.zip" -DestinationPath "$TMP_PATH\gum"
Move-Item -Path "$TMP_PATH\gum\$GUM_PATH\gum.exe" -Destination "$TMP_PATH"
Remove-Item -Path "$TMP_PATH\*" -Exclude "gum.exe" -Recurse
