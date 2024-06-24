[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $Path,
    [Parameter(Mandatory=$true)]
    [string]
    $DestinationPath    
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $Path -PathType Container)) {
    throw "Backup folder does not exist."
    return 1
}

if (-not (Test-Path $DestinationPath -PathType Container)) {
    New-Item -Path $DestinationPath -ItemType Directory | Out-Null      
}

$BackupFolder = Get-Item -Path $Path

Write-Host "Zipping backup folder"
$zipFile = "$($BackupFolder.Name).zip"

Compress-Archive -Path $Path -DestinationPath $(Join-Path -Path $DestinationPath -ChildPath $zipFile) -Force