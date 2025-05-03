# Oh my posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\gruvbox.omp.json" | Invoke-Expression

# Terminal icons
Import-Module -Name Terminal-Icons

# gitignore.io
Function Get-GitIgnore {
  param(
    [Parameter(Mandatory = $true)]
    [string[]]$list,

    [Parameter()]
    [bool]$Preview = $false
  )

  $params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ","
  $uri = "https://www.toptal.com/developers/gitignore/api/$params"
  $content = Invoke-WebRequest -Uri $uri | Select-Object -ExpandProperty Content 

  if ($Preview) { 
      Write-Output $content
  }
  else {
     $filePath = Join-Path -Path $PWD -ChildPath ".gitignore"
     $content | Out-File -FilePath $filePath -Encoding ascii
  }
}
