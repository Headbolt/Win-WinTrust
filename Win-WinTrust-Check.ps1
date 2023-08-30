###############################################################################################################
#
# ABOUT THIS PROGRAM
#
#   Win-WinTrust-Check.ps1
#   https://github.com/Headbolt/Win-WinTrust

#  This script was designed to Check specific registry values
#  and then exit with an appropriate Exit code.
#
#  Intended use is in Microsoft Endpoint Manager, as the "Check" half of a Proactive Remediation Script
#  The "Remediate" half is found here https://github.com/Headbolt/Win-WinTrust
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
$32BitCheck=(Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config -Name "EnableCertPaddingCheck").EnableCertPaddingCheck
$64BitCheck=(Get-ItemProperty -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Cryptography\Wintrust\Config -Name "EnableCertPaddingCheck").EnableCertPaddingCheck
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
if($32BitCheck -ne 1){
	Exit 1
}
#
if($64BitCheck -ne 1){
	Exit 1
}
#
Exit 0
