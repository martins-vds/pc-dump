[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $Path
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $Path -PathType Container)) {
    New-Item -Path $Path -ItemType Directory | Out-Null
}

Write-Host "Exporting installed applications to apps.json"

winget.exe export --accept-source-agreements -o "$(Join-Path -Path $Path -ChildPath "apps.json")" | Out-Null

Write-Host "Done."
