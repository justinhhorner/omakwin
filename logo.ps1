$WIN_LOGO = '////////  ////////
////////  ////////
////////  ////////
                  
////////  ////////
////////  ////////
////////  ////////'

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
