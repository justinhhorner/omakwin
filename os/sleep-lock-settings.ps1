$REG_SCREEN_SAVE_TIMEOUT_PATH = "HKCU:\Control Panel\Desktop"
$REG_SCREEN_SAVER_IS_SECURE_PATH = "HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop"

# Save the current screen save timeout and is secure values to use during revert
$ErrorActionPreference="SilentlyContinue"
$CURRENT_SCREEN_SAVE_TIMEOUT = Get-ItemPropertyValue -Path $REG_SCREEN_SAVE_TIMEOUT_PATH -Name "ScreenSaveTimeOut"
$CURRENT_SCREEN_SAVER_IS_SECURE = Get-ItemPropertyValue -Path $REG_SCREEN_SAVER_IS_SECURE_PATH -Name "ScreenSaverIsSecure"
$ErrorActionPreference="Stop"

if (!$CURRENT_SCREEN_SAVE_TIMEOUT) {
    $CURRENT_SCREEN_SAVE_TIMEOUT = 0
}
if (!$CURRENT_SCREEN_SAVER_IS_SECURE) {
    $CURRENT_SCREEN_SAVER_IS_SECURE = 0
}

function Set-SleepLockSettings {
    param (
        [bool]$Set
    )

    if ($Set) {
         # We don't want Windows to sleep or lock while installing
        Set-ItemProperty -Path $CURRENT_SCREEN_SAVER_IS_SECURE -Name "ScreenSaverIsSecure" -Value 0
        Set-ItemProperty -Path $CURRENT_SCREEN_SAVE_TIMEOUT -Name "ScreenSaveTimeOut" -Value 0
    } else {
        # Revert to normal idle and lock settings
        Set-ItemProperty -Path $CURRENT_SCREEN_SAVER_IS_SECURE -Name "ScreenSaverIsSecure" -Value $CURRENT_SCREEN_SAVER_IS_SECURE
        Set-ItemProperty -Path $CURRENT_SCREEN_SAVE_TIMEOUT -Name "ScreenSaveTimeOut" -Value $CURRENT_SCREEN_SAVE_TIMEOUT
    }
}
