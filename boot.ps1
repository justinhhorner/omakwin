# Exit immediately if a command exits with a non-zero status
$ErrorActionPreference = "Stop"
    
$OMAKWIN_LOGO='________                  __           .__            ////////   //////// 
\_____  \   _____ _____  |  | ___  _  _|__| ____      ////////   ////////  
 /   |   \ /     \\__  \ |  |/ | \/ \/ /  |/    \     ////////   ////////
/    |    \  Y Y  \/ __ \|    < \     /|  |   |  \
\_______  /__|_|  (____  /__|_ \ \/\_/ |__|___|  /    ////////   ////////
        \/      \/     \/     \/               \/     ////////   ////////
                Peak Windows for Game Programmers     ////////   ////////'

Write-Output "$OMAKWIN_LOGO`n"
Write-Host "Omakwin is for fresh Windows 11 installations only!"
Write-Host "Elevated privileges required."

$CONTINUE_INPUT = Read-Host -Prompt "`r`nBegin installation? ([Y]es or abort with CTRL+C)..."
if ($CONTINUE_INPUT -eq "Y") {
    Write-Host "Creating temp directory..."
    $TMP_PATH = "$env:TMP\omakwin"
    if (!(Test-Path -Path $TMP_PATH)) {
        New-Item -ItemType Directory -Path $TMP_PATH
    }
   
    Write-Host "Downloading Git..."
    $GIT_VERSION = "2.49.0"
    $GIT_INSTALLER_URL = "https://github.com/git-for-windows/git/releases/latest/download/Git-${GIT_VERSION}-64-bit.exe"
    $GIT_INSTALLER_PATH = "${TMP_PATH}\git-installer.exe"
    if (Test-Path -Path $GIT_INSTALLER_PATH)
    {
        Write-Host "Git installer found. Skipping download."
    } 
    else 
    {
        Invoke-WebRequest -Uri $GIT_INSTALLER_URL -OutFile $GIT_INSTALLER_PATH
    }


    Write-Host "Installing Git..."
    Start-Process -FilePath $GIT_INSTALLER_PATH -ArgumentList "/VERYSILENT", "/NORESTART", "/SUPPRESSMSGBOXES" -Wait

    Write-Host "Adding Git to Path..."
    $env:PATH += ";C:\Program Files\Git\cmd"

    Write-Host "Cloning Omakwin..."
    Remove-Item $env:LOCALAPPDATA\omakwin -Force -Recurse -ErrorAction Ignore
    git clone https://github.com/justinhhorner/omakwin.git $env:LOCALAPPDATA\omakwin

    Write-Host "Removing temp files..."
    Remove-Item "${TMP_PATH}\git-installer.exe" -Force -ErrorAction Ignore

    Write-Host "Installation starting..."
    . $env:LOCALAPPDATA\omakwin\install.ps1

} else {
    Write-Host "Installation cancelled"
}
