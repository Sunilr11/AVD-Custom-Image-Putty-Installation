$url = "https://www.chiark.greenbank.net/site/putty/win32/putty.exe"
$installDir = "C:\Program Files\Putty"
$shortcutDir = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs"

# Create installation directory
New-Item -ItemType Directory -Path $installDir -Force

# Download Putty
Invoke-WebRequest -Uri $url -OutFile "$installDir\putty.exe"

# Create shortcut (optional)
$shortcutPath = Join-Path $shortcutDir "Putty.lnk"
New-Item -ItemType File -Path $shortcutPath -ItemType Shortcut -Property @{
  "Target" = "$installDir\putty.exe"
  "WorkingDirectory" = $installDir
}
