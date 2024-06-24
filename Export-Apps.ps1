$ErrorActionPreference = 'Stop'

Write-Host "Exporting installed applications to apps.json"

winget.exe export --accept-source-agreements -o "apps.json" | Out-Null

Write-Host "Done."
