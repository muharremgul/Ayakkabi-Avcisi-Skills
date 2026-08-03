param(
    [ValidateSet('codex', 'claude', 'gemini', 'copilot', 'agents', 'all')]
    [string]$Target
)

$ErrorActionPreference = 'Stop'

$skillNames = @(
    'shoe-analyzer',
    'product-matcher',
    'price-hunter',
    'deal-evaluator',
    'shoe-recommender',
    'review-summarizer',
    'weekly-market-report'
)

$targetDirectories = [ordered]@{
    codex   = Join-Path $env:USERPROFILE '.codex\skills'
    claude  = Join-Path $env:USERPROFILE '.claude\skills'
    gemini  = Join-Path $env:USERPROFILE '.gemini\skills'
    copilot = Join-Path $env:USERPROFILE '.copilot\skills'
    agents  = Join-Path $env:USERPROFILE '.agents\skills'
}

if (-not $Target) {
    Write-Host ''
    Write-Host 'Ayakkabı Avcısı Skills Kurulumu' -ForegroundColor Cyan
    Write-Host '1 - Codex'
    Write-Host '2 - Claude Code'
    Write-Host '3 - Gemini CLI'
    Write-Host '4 - GitHub Copilot'
    Write-Host '5 - Ortak Agent Skills dizini'
    Write-Host '6 - Tümüne kur'
    Write-Host ''
    $selection = Read-Host 'Seçiminiz'
    $Target = switch ($selection) {
        '1' { 'codex' }
        '2' { 'claude' }
        '3' { 'gemini' }
        '4' { 'copilot' }
        '5' { 'agents' }
        '6' { 'all' }
        default { throw 'Geçersiz seçim.' }
    }
}

$sourceRoot = $PSScriptRoot
$temporaryRoot = $null
$firstSkill = Join-Path $sourceRoot 'shoe-analyzer\SKILL.md'

if (-not (Test-Path -LiteralPath $firstSkill)) {
    $packagePath = Join-Path $PSScriptRoot 'Ayakkabi-Avcisi-Skills-v1.0.0.zip'
    if (-not (Test-Path -LiteralPath $packagePath)) {
        throw "Skill paketi bulunamadı: $packagePath"
    }
    $temporaryRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("ayakkabi-avcisi-" + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Force -Path $temporaryRoot | Out-Null
    Expand-Archive -LiteralPath $packagePath -DestinationPath $temporaryRoot -Force
    $sourceRoot = $temporaryRoot
}

try {
    $selectedTargets = if ($Target -eq 'all') { @($targetDirectories.Keys) } else { @($Target) }

    foreach ($selectedTarget in $selectedTargets) {
        $destinationRoot = $targetDirectories[$selectedTarget]
        New-Item -ItemType Directory -Force -Path $destinationRoot | Out-Null

        foreach ($skillName in $skillNames) {
            $sourcePath = Join-Path $sourceRoot $skillName
            if (-not (Test-Path -LiteralPath (Join-Path $sourcePath 'SKILL.md'))) {
                throw "Eksik skill: $sourcePath"
            }
            Copy-Item -LiteralPath $sourcePath -Destination $destinationRoot -Recurse -Force
        }

        Write-Host "Kuruldu: $selectedTarget -> $destinationRoot" -ForegroundColor Green
    }

    Write-Host ''
    Write-Host 'Kurulum tamamlandı. Yapay zekâ uygulamasını yeniden başlatın veya skill listesini yenileyin.' -ForegroundColor Cyan
}
finally {
    if ($temporaryRoot -and (Test-Path -LiteralPath $temporaryRoot)) {
        Remove-Item -LiteralPath $temporaryRoot -Recurse -Force
    }
}
