# Get a list of optional apps based on the files in install/desktop/optional
$OPTIONAL_APP_PATH = "${env:LOCALAPPDATA}\omakwin\install\desktop\optional"
$OPTIONAL_APPS = Get-ChildItem -Path $OPTIONAL_APP_PATH -Filter "app-*.ps1" |
    ForEach-Object {
        if ($_ -match "^app-(.+)\.ps1") {
            $APP_NAME = $Matches[1]
            $APP_NAME.Substring(0, 1).ToUpper() + $APP_NAME.Substring(1)
        }
    } | Where-Object { $_ } | Sort-Object

$OPTIONAL_APPS -join " "

$DEFAULT_OPTIONAL_APPS = "1password,Brave,Steam,Discord"
$OPTIONAL_CHOICES = Invoke-Expression "${env:TMP}\omakwin\gum.exe choose ${OPTIONAL_APPS} --no-limit --selected ${DEFAULT_OPTIONAL_APPS}"
