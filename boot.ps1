$ErrorActionPreference = "Stop"

function DisplayLogo {
    
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
}


DisplayLogo
Write-Host "Omakwin is for fresh Windows 11 installations only!"
Write-Host "Elevated privileges required."
$CONTINUE_INPUT = Read-Host -Prompt "`r`nBegin installation? ([Y]es or abort with CTRL+C)"

if ($CONTINUE_INPUT -eq "Y") {
    Write-Host "Installing Git..."
    # TODO: Install Git via winget

    Write-Host "Cloning Omakwin..."
    #TODO: Clone Omakwin to LOCALAPPDATA\omakwin

    Write-Host "Installation starting..."
    # TODO: Invoke install.ps1 from within LOCALAPPDATA\omakwin

} else {
    Write-Host "Installation cancelled"
}
