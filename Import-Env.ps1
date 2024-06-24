[CmdletBinding(ConfirmImpact='High', SupportsShouldProcess=$true)]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $EnvFile
)

$env = Get-Content $EnvFile | ConvertFrom-Json

$yesToAll = $false
$noToAll = $false

foreach ($variable in $env.system) {
    $continue = $PSCmdlet.ShouldContinue("System variable: $($variable.name)", "Set system variable: $($variable.name) to $($variable.value)", [ref] $yesToAll, [ref] $noToAll)

    if ($continue) {
        [System.Environment]::SetEnvironmentVariable($variable.name, $variable.value, [System.EnvironmentVariableTarget]::Machine) 
    }
}

$yesToAll = $false
$noToAll = $false

foreach ($variable in $env.user) {
    $continue = $PSCmdlet.ShouldContinue("User variable: $($variable.name)", "Set user variable: $($variable.name) to $($variable.value)", [ref] $yesToAll, [ref] $noToAll)

    if ($continue) {
        [System.Environment]::SetEnvironmentVariable($variable.name, $variable.value, [System.EnvironmentVariableTarget]::User) 
    }
}