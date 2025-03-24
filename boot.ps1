$ErrorActionPreference = "Stop"
    
$WIN_LOGO = '////////   ////////
////////   ////////
////////   ////////
                  
////////   ////////
////////   ////////
////////   ////////'

$OMAKWIN_LOGO='________                  __           .__        
\_____  \   _____ _____  |  | ___  _  _|__| ____  
 /   |   \ /     \\__  \ |  |/ | \/ \/ /  |/    \ 
/    |    \  Y Y  \/ __ \|    < \     /|  |   |  \
\_______  /__|_|  (____  /__|_ \ \/\_/ |__|___|  /
        \/      \/     \/     \/               \/ 
                Peak Windows for Game Programmers'

$LOGO_COLORS = @(
"DarkBlue",
"DarkBlue",
"Blue",
"Blue",
"Blue",
"DarkBlue",
"White"
)

$WIN_LOGO = $WIN_LOGO -Split "`n"
$OMAKWIN_LOGO = $OMAKWIN_LOGO -Split "`n"

for ($LINE_INDEX = 0; $LINE_INDEX -lt $OMAKWIN_LOGO.Length; $LINE_INDEX++) {
    $COLOR = $LOGO_COLORS[$LINE_INDEX]
    Write-Host -ForegroundColor $COLOR $OMAKWIN_LOGO[$LINE_INDEX]

    $WIN_LOGO_DISTANCE = ("`t    " * 6) -Join ""
    Write-Host -NoNewline $WIN_LOGO_DISTANCE
    Write-Host -NoNewline -ForegroundColor Blue $WIN_LOGO[$LINE_INDEX]
}
Write-Output "`n"

Write-Host "Omakwin is for fresh Windows 11 installations only!"
Write-Host "Elevated privileges required."
$CONTINUE_INPUT = Read-Host -Prompt "`r`nBegin installation? ([Y]es or abort with CTRL+C)"

if ($CONTINUE_INPUT -eq "Y") {
    Write-Host "Installing Git..."
    winget install -e Git.Git --accept-source-agreements --accept-package-agreements

    Write-Host "Cloning Omakwin..."
    Remove-Item $env:LOCALAPPDATA\omakwin -Force -Recurse -ErrorAction Ignore
    git clone https://github.com/justinhhorner/omakwin.git $env:LOCALAPPDATA\omakwin

    Write-Host "Installation starting..."
    . $env:LOCALAPPDATA\omakwin\install.ps1

} else {
    Write-Host "Installation cancelled"
}
