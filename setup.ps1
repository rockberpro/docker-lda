#Requires -Version 5.1

$aliasesUrl  = "https://raw.githubusercontent.com/rockberpro/docker-lda/main/docker-lda.ps1"
$installPath = "$HOME\.docker-lda.ps1"

$helpUrl  = "https://raw.githubusercontent.com/rockberpro/docker-lda/main/docker-lda-help.ps1"
$helpPath = "$HOME\.docker-lda-help.ps1"

Invoke-WebRequest -Uri $aliasesUrl -UseBasicParsing -OutFile $installPath
Invoke-WebRequest -Uri $helpUrl    -UseBasicParsing -OutFile $helpPath

$profileDir = Split-Path $PROFILE
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}
if (-not (Test-Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}

$sourceLine = ". `"$installPath`""
$content    = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
if ($content -notlike "*$installPath*") {
    Add-Content -Path $PROFILE -Value "`n$sourceLine"
}

Write-Host "docker-lda installed: $installPath"
Write-Host "docker-lda help installed: $helpPath"
Write-Host "Run '. `$PROFILE' or open a new terminal to activate."
