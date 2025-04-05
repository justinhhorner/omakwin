$OPTIONAL_APPS="1Password Steam GOG Itch Spotify Discord Zoom"
$DEFAULT_OPTIONAL_APPS="1Password,Steam,Spotify,Discord"
$OPTIONAL_CHOICES=Invoke-Expression "${env:TMP}\omakwin\gum.exe choose ${OPTIONAL_APPS} --no-limit --selected ${DEFAULT_OPTIONAL_APPS}"
