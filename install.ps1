param(
    [Bool]$Debug=$true
)

if ($Debug) {
    # Replace app data omakwin files with files from local dev
    $LOCAL_DIR_PATH = "${env:LOCALAPPDATA}\omakwin"
    $DEV_DIR_PATH = "..\omakwin\"

    if (Test-Path $LOCAL_DIR_PATH) {
        Remove-Item -Path $LOCAL_DIR_PATH
    }

    Copy-Item -Path $DEV_DIR_PATH -Destination $LOCAL_DIR_PATH -Recurse
}

# Exit immediately if a command exits with a non-zero status
$ErrorActionPreference = "Stop"

# Import OS functions
. $env:LOCALAPPDATA\omakwin\os\sleep-lock-settings.ps1
. $env:LOCALAPPDATA\omakwin\os\check-version.ps1

if (IsSupportedOS) {
    Write-Output "Time to make a few choices..."
    . $env:LOCALAPPDATA\oamwkin\install\terminal\app-gum.ps1
    . $env:LOCALAPPDATA\omakwin\install\choices.ps1

} else {
    Write-Output "Omakwin only supports Windows 11"
}
