[CmdletBinding(ConfirmImpact='High', SupportsShouldProcess=$true)]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $Path
)

$ErrorActionPreference = 'Stop'

# Import xml files from the specified folder
$wifiProfiles = Get-ChildItem -Path $Path -Filter '*.xml'

foreach ($wifiProfile in $wifiProfiles) {
    netsh wlan add profile filename="$($wifiProfile.FullName)" user=all
}
