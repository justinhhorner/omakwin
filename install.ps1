# $DEBUG is used to automatically replace the omakwin directory in LOCALAPPDATA with the latest from local dev 
# TODO: Remove before 1.0 release
param(
    [Bool]$Debug=$true
)

if ($Debug) {
    $LOCAL_DIR_PATH = "${env:LOCALAPPDATA}\omakwin"
    $DEV_DIR_PATH = "..\omakwin\"

    if (Test-Path $LOCAL_DIR_PATH) {
        Remove-Item -Path $LOCAL_DIR_PATH -Force -Recurse
    }

    Copy-Item -Path $DEV_DIR_PATH -Destination $LOCAL_DIR_PATH -Recurse
}

# Exit immediately if a command exits with a non-zero status
$ErrorActionPreference = "Stop"

# Load paths to be used
. $env:LOCALAPPDATA\omakwin\util\paths.ps1

# Import OS functions
. $OS_PATH\sleep-lock-settings.ps1
. $OS_PATH\check-version.ps1

if (IsSupportedOS) 
{
    Write-Output "Time to make a few choices..."
    . $INSTALL_TERMINAL_PATH\app-gum.ps1
    . $INSTALL_DESKTOP_PATH\optional-desktop-choices.ps1
} 
else 
{
    Write-Output "Omakwin only supports Windows 11"
}
