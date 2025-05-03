$REG_KEY_NAME="MinAnimate"
$REG_KEY_ANIMATION_EFFECTS="HKCU:\Control Panel\Desktop\WindowMetrics"

if (!(Test-Path $REG_KEY_ANIMATION_EFFECTS -eq $true)) {
  New-Item -Path $REG_KEY_ANIMATION_EFFECTS -Force
}

if (-not (Get-ItemProperty -Path $REG_KEY_ANIMATION_EFFECTS -Name $REG_KEY_NAME -ErrorAction SilentlyContinue)) {
  New-ItemProperty -Path $regPath -Name $regName -Value 0 -PropertyType DWord -Force
} else {
  Set-ItemProperty -Path $REG_KEY_ANIMATION_EFFECTS -Name $REG_KEY_NAME -Value 0
}

Write-Output "Windows: Animations Effects Disabled"
