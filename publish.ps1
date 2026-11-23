param(
    [string[]]$Repos = @("maier-dev-pixel/maier-dev-pixel.github.io", "maier-dev-pixel/portfolio")
)

$ErrorActionPreference = "Stop"

$dir = "C:\Users\AL-BATRIQ\OneDrive\Pictures\Documents\Default Project\portfolio-site"
$files = @("index.html", "styles.css", "script.js", "README.md", "robots.txt", "publish.ps1")

function Set-RepoFile {
    param([string]$Repo, [string]$File, [string]$Message)

    $path = "repos/$Repo/contents/$File"
    $sha = $null
    try {
        $sha = gh api "${path}?ref=main" --jq .sha 2>$null
    } catch {
        $sha = $null
    }

    $bytes = [IO.File]::ReadAllBytes((Join-Path $dir $File))
    $b64 = [Convert]::ToBase64String($bytes)

    $ghArgs = @("--method", "PUT", $path, "-f", "message=$Message", "-f", "content=$b64", "-f", "branch=main")
    if ($sha) { $ghArgs += @("-f", "sha=$sha") }

    gh api @ghArgs --jq '.commit.sha' 2>$null | Out-Null
    Write-Host "  $Repo : $File"
}

foreach ($repo in $Repos) {
    Write-Host "Publishing to $repo ..."
    foreach ($file in $files) {
        Set-RepoFile -Repo $repo -File $file -Message "Update $file"
    }
}

Write-Host "Done."
