function IsSupportedOS {
    $WIN_SUPPORTED_VERSION = "10.0.2*" # Windows 11
    $WIN_CURRENT_VERSION = (Get-CimInstance -ClassName Win32_OperatingSystem).Version

    $IS_SUPPORTED_WIN_VERSION = $WIN_CURRENT_VERSION -Like $WIN_SUPPORTED_VERSION
    return $IS_SUPPORTED_WIN_VERSION
}
