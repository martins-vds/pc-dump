$ErrorActionPreference = 'Stop'

# Check if the specified folder exists
if (-not (Test-Path $Path -PathType Container)) {
    New-Item -Path $Path -ItemType Directory | Out-Null
}

Write-Host "Exporting installed applications to apps.json"

winget.exe export --accept-source-agreements -o "apps.json" | Out-Null

Write-Host "Done."
