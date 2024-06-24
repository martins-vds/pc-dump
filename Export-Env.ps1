# Dump system and user environment variables to a json file.
# Usage: .\Dump-Env.ps1
# Sample dump:
# {
#     "system": [
#         { "name": "ALLUSERSPROFILE", "value": "C:\\ProgramData"}
#     ],
#     "User": [
#         { "name": "ALLUSERSPROFILE", "value": "C:\\ProgramData"}
#     ]
# }

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

$env | ConvertTo-Json | Out-File -FilePath env.json