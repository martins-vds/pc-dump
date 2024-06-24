[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $Path
)

if (-not (Test-Path $Path -PathType Container)) {
    New-Item -Path $Path -ItemType Directory | Out-Null
}

netsh wlan export profile key=clear folder="$Path"