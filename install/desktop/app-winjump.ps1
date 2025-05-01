$RELEASE_VERSION = "2.0.15"
$RELEASE_VERSION_FILE = $RELEASE_VERSION -replace '\.', '_'
$GIT_INSTALLER_URL = "https://github.com/widavies/WinJump/releases/download/${RELEASE_VERSION}/WinJump.exe"
$GIT_INSTALLER_PATH = "${TMP_PATH}\WinJump_${RELEASE_VERSION_FILE}.exe"

Invoke-WebRequest -Uri $GIT_INSTALLER_URL -OutFile $GIT_INSTALLER_PATH
Move-Item -Path $GIT_INSTALLER_PATH -Destination $STARTUP_PATH
