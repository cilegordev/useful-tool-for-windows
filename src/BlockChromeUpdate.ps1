# *******************************************
#
# Mod by: Jared M. Smith
# Mod on: 2015.01.14
# Mod y?: Disable Google Chrome updates.
#
# *******************************************
#
# Tester: Cilegordev
# Date: 26-08-2024
# Work on Google Chrome 116.0.5845.188
# https://google-chrome.en.uptodown.com/windows/download/107461017
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