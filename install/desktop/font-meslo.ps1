$FONT_NAME = "MesloLGSNerdFontMono"
$RELEASE_VERSION = "3.4.0"
$FONTS_OBJ = (New-Object -ComObject Shell.Application).Namespace(0x14)
$DOWNLOAD_URI = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${RELEASE_VERSION}/Meslo.zip"
$DOWNLOAD_PATH = "${env:TMP}\omakwin\fonts\${FONT_NAME}"
$ZIP_FILE_PATH = "${DOWNLOAD_PATH}.zip"

Invoke-WebRequest -Uri $DOWNLOAD_URI -OutFile $ZIP_FILE_PATH
Expand-Archive -LiteralPath $ZIP_FILE_PATH -DestinationPath $DOWNLOAD_PATH

$FONT_FACES_TO_INSTALL = @(
    "Regular",
    "Italic",
    "Bold",
    "BoldItalic"
)

foreach ($FONT_FACE in $FONT_FACES_TO_INSTALL) {
    $FONTS_OBJ.CopyHere("${DOWNLOAD_PATH}\${FONT_NAME}-${FONT_FACE}.ttf")
}

Remove-Item -Path $ZIP_FILE_PATH
Remove-Item -Path $DOWNLOAD_PATH -Recurse -Force
