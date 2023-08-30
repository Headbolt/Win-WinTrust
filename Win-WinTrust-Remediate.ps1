###############################################################################################################
#
# ABOUT THIS PROGRAM
#
#   Win-WinTrust-Remediate.ps1
#   https://github.com/Headbolt/Win-WinTrust
#
#  This script was designed to Set specific registry values
#
#  Intended use is in Microsoft Endpoint Manager, as the "Remediate" half of a Proactive Remediation Script
#  The "Check" half is found here https://github.com/Headbolt/Win-WinTrust
#
###############################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 30/08/2023
#
#   - 30/08/2023 - V1.0 - Created by Headbolt
#
###############################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################
#
#
$ExitCode=0 # Setting ExitCode Variable to an initial 0
#
###############################################################################################################
#
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################
#
# Begin Processing
#
###############################################################################################################
#
Write-Output ""
#
if (test-path HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust) {
	Write-Output "The registry key HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust exists"
}
else {
	Write-Output "The registry key HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust does not exist, Creating it"
	New-Item -Path HKLM:\SOFTWARE\Microsoft\Cryptography\ -Name Wintrust -Force | Out-Null
}
#
if (test-path HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config) {
	Write-Output "The registry key HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config exists"
}
else {
	Write-Output "The registry key HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config does not exist, Creating it"
	New-Item -Path HKLM:\SOFTWARE\Microsoft\Cryptography\WinTrust -Name Config -Force | Out-Null
}
#
Write-Output "Setting registry Value HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config\EnableCertPaddingCheck to 1"
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Cryptography\WinTrust\Config -Name EnableCertPaddingCheck -PropertyType String -Value 1 -Force | Out-Null
#
Write-Output ""
#
if (test-path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\Wintrust) {
	Write-Output "The registry key HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\Wintrust exists"
}
else {
	Write-Output "The registry key HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\Wintrust does not exist, Creating it"
	New-Item -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\ -Name Wintrust -Force | Out-Null
}
#
if (test-path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\Wintrust\Config) {
	Write-Output "The registry key HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\Wintrust\Config exists"
}
else {
	Write-Output "The registry key HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\Wintrust\Config does not exist, Creating it"
	New-Item -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\WinTrust -Name Config -Force | Out-Null
}
#
Write-Output "Setting registry Value HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\Wintrust\Config\EnableCertPaddingCheck to 1"
New-ItemProperty -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\WinTrust\Config -Name EnableCertPaddingCheck -PropertyType String -Value 1 -Force | Out-Null
#
#
Exit 0
