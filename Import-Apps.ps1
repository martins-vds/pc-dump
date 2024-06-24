[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $AppsFile
)

$ErrorActionPreference = 'Stop'

# Import json file from the specified folder
winget.exe --import -i "$AppsFile" --accept-package-agreements --ignore-unavailable