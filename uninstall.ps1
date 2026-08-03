param(
    [ValidateSet('codex', 'claude', 'gemini', 'copilot', 'agents', 'all')]
    [string]$Target = 'all',
    [switch]$Force
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

$selectedTargets = if ($Target -eq 'all') { @($targetDirectories.Keys) } else { @($Target) }

if (-not $Force) {
    $answer = Read-Host 'Seçilen hedeflerdeki Ayakkabı Avcısı skill klasörleri kaldırılacak. Devam edilsin mi? (E/H)'
    if ($answer -notin @('E', 'e', 'Y', 'y')) {
        Write-Host 'İşlem iptal edildi.'
        exit 0
    }
}

foreach ($selectedTarget in $selectedTargets) {
    $destinationRoot = $targetDirectories[$selectedTarget]
    foreach ($skillName in $skillNames) {
        $skillPath = Join-Path $destinationRoot $skillName
        if (Test-Path -LiteralPath $skillPath) {
            Remove-Item -LiteralPath $skillPath -Recurse -Force
            Write-Host "Kaldırıldı: $skillPath" -ForegroundColor Yellow
        }
    }
}

Write-Host 'Kaldırma işlemi tamamlandı.' -ForegroundColor Cyan
