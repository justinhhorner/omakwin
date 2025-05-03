$REG_PATH_AUTOHIDE_TASKBAR="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3"
$REG_KEY_NAME = "Settings"
$REG_AUTOHIDE_TASKBAR_BYTE_POS=8
$REG_AUTOHIDE_ENABLED=123 # Use 122 to disable auto-hide

# Get the current settings
$SETTINGS = (Get-ItemProperty -Path $REG_PATH_AUTOHIDE_TASKBAR).$REG_KEY_NAME

# Enable auto-hide by setting the 9th byte to 3
$SETTINGS[$REG_AUTOHIDE_TASKBAR_BYTE_POS] = $REG_AUTOHIDE_ENABLED

# Update the registry with the new settings
Set-ItemProperty -Path $REG_PATH_AUTOHIDE_TASKBAR -Name $REG_KEY_NAME -Value $SETTINGS

# Restart Explorer to apply the changes
Stop-Process -Name explorer -Force
