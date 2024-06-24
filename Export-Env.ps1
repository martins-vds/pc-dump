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

$systemVariables = [System.Environment]::GetEnvironmentVariables([System.EnvironmentVariableTarget]::Machine)
$userVariables = [System.Environment]::GetEnvironmentVariables([System.EnvironmentVariableTarget]::User)

$system = @()
$user = @()

foreach ($key in $systemVariables.Keys) {
    $system += @{ "name" = $key; "value" = $systemVariables[$key] }
}

foreach ($key in $userVariables.Keys) {
    $user += @{ "name" = $key; "value" = $userVariables[$key] }
}

$env = @{ 
    "system" = $system
    "user" = $user 
}

$env | ConvertTo-Json | Out-File -FilePath $(Join-Path -Path $Path -ChildPath "env.json")