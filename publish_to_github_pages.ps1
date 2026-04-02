param(
    [Parameter(Mandatory = $true)]
    [string]$RemoteUrl,

    [string]$Branch = "main",
    [string]$CommitMessage = "Publish ticket site to GitHub Pages",
    [switch]$SkipPush
)

$ErrorActionPreference = "Stop"

$SiteRoot = (Resolve-Path $PSScriptRoot).Path
Push-Location $SiteRoot

try {
    if (-not (Test-Path ".git")) {
        git init | Out-Host
    }

    git checkout -B $Branch | Out-Host

    if (-not (git remote 2>$null | Select-String -SimpleMatch "origin")) {
        git remote add origin $RemoteUrl
    }
    else {
        git remote set-url origin $RemoteUrl
    }

    git add . | Out-Host

    $hasChanges = $false
    git diff --cached --quiet
    if ($LASTEXITCODE -ne 0) {
        $hasChanges = $true
    }

    if ($hasChanges) {
        git commit -m $CommitMessage | Out-Host
    }
    else {
        Write-Host "No staged content changes to commit."
    }

    if (-not $SkipPush) {
        git push -u origin $Branch | Out-Host
    }
    else {
        Write-Host "Push skipped."
    }
}
finally {
    Pop-Location
}