# *******************************************
#
# Mod by: Jared M. Smith
# Mod on: 2015.01.14
# Mod y?: Disable Google Chrome updates.
#
# *******************************************
#
# Tester: Cilegordev
# Date: 30-08-2024
# Work good on Google Chrome 118.0.5993.118
# https://www.filepuma.com/download/google_chrome_64bit_118.0.5993.118-36892
#
# *******************************************

# Log method
function Log { Param([string]$message) Write-Host $message; }

# Get current path
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

Log "Disabling Google Chrome updates once and for all!"

New-Item -Path HKLM:\SOFTWARE\Policies\Google -name Update -value 0 -Force
New-Item -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Google -name Update -value 0 -Force

New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Update -type dword -name AutoUpdateCheckPeriodMinutes -value 0 -Force
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Update -type dword -name DisableAutoUpdateChecksCheckboxValue -value 1 -Force
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Update -type dword -name "Update{8A69D345-D564-463C-AFF1-A69D9E530F96}" -value 0 -Force
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Update -type dword -name UpdateDefault -value 0 -Force

New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Google\Update -type dword -name AutoUpdateCheckPeriodMinutes -value 0 -Force
New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Google\Update -type dword -name DisableAutoUpdateChecksCheckboxValue -value 1 -Force
New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Google\Update -type dword -name "Update{8A69D345-D564-463C-AFF1-A69D9E530F96}" -value 0 -Force
New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Policies\Google\Update -type dword -name UpdateDefault -value 0 -Force

Log "Added registry keys to disable Google updates."

Stop-Service gupdate
Stop-Service gupdatem

Log "Stopped running Google update services(s)."
