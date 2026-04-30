# ==============================================================================
# LDA Help — Logical Docker Aliases
# https://github.com/rockberpro/docker-lda
# ==============================================================================

$ldaFile = if ($env:DOCKER_LDA_FILE) { $env:DOCKER_LDA_FILE } else { "$HOME\.docker-lda.ps1" }

if (-not (Test-Path $ldaFile)) {
    Write-Error "Error: $ldaFile not found."
    exit 1
}

$aliases = [System.Collections.Generic.List[PSCustomObject]]::new()
$currentGroup = "Other"

foreach ($line in Get-Content $ldaFile) {
    if ($line -match '^#\s*---\s*(.+?)\s*---') {
        $raw = $Matches[1].ToLower()
        $currentGroup = (Get-Culture).TextInfo.ToTitleCase($raw)
        continue
    }
    if ($line -match '^function\s+(\w+)\s*\{\s*(.+?)\s*@args\s*\}') {
        $aliases.Add([PSCustomObject]@{
            Name    = $Matches[1]
            Command = $Matches[2].Trim()
            Group   = $currentGroup
        })
    }
}

if ($aliases.Count -eq 0) {
    Write-Host "No aliases found in $ldaFile."
    exit 0
}

$groups = [System.Collections.Specialized.OrderedDictionary]::new()
foreach ($a in $aliases) {
    if (-not $groups.Contains($a.Group)) { $groups[$a.Group] = [System.Collections.Generic.List[PSCustomObject]]::new() }
    $groups[$a.Group].Add($a)
}

$aliasWidth = 6
$cmdWidth   = 38
$innerW     = 1 + $aliasWidth + 3 + $cmdWidth + 1

function wc($text, $color) { Write-Host $text -ForegroundColor $color -NoNewline }

$b = 'DarkGray'

# Top border + title
wc '╔' $b; wc ('═' * $innerW) $b; wc "╗`n" $b

$titleText = ' Docker Aliases '
$lp = [Math]::Floor(($innerW - $titleText.Length) / 2)
$rp = $innerW - $lp - $titleText.Length
wc '║' $b; Write-Host (' ' * $lp) -NoNewline; wc $titleText 'Magenta'; Write-Host (' ' * $rp) -NoNewline; wc "║`n" $b

wc '╠' $b; wc ('═' * $innerW) $b; wc "╣`n" $b

foreach ($g in $groups.Keys) {
    $label = "── $g ──"
    $pad   = $innerW - 2 - $label.Length
    wc '║' $b; Write-Host ' ' -NoNewline; wc $label 'Blue'; Write-Host (' ' * $pad + ' ') -NoNewline; wc "║`n" $b

    foreach ($a in $groups[$g]) {
        $cmd = $a.Command
        if ($cmd.Length -gt $cmdWidth) { $cmd = $cmd.Substring(0, $cmdWidth - 1) + '~' }
        $aliasCell = $a.Name.PadRight($aliasWidth)
        $cmdCell   = $cmd.PadRight($cmdWidth)
        wc '║' $b
        Write-Host ' ' -NoNewline
        wc $aliasCell 'Green'
        Write-Host ' ' -NoNewline
        wc '│' $b
        Write-Host " $cmdCell " -NoNewline
        wc "║`n" $b
    }
}

wc '╚' $b; wc ('═' * $innerW) $b; wc "╝`n" $b

Write-Host "  $($aliases.Count) aliases across $($groups.Count) groups" -ForegroundColor DarkGray
