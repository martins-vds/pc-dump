[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $ZipPath,
    [Parameter(Mandatory=$true)]
    [string]
    $DestinationPath
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $ZipPath -PathType Leaf)) {
    throw "Backup folder zip file does not exist."
    return 1
}

if (-not (Test-Path $DestinationPath -PathType Container)) {
    New-Item -Path $DestinationPath -ItemType Directory | Out-Null      
}

$BackupFolder = Get-Item -Path $ZipPath

Write-Host "Unzipping backup folder"

Expand-Archive -Path $BackupFolder -DestinationPath $DestinationPath -Force