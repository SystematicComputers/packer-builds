Start-Transcript -Path 'c:\temp\packer-log.txt' -append
Write-Output "auto unattend script started..."
########################################################
#
#  Set Powershell Execution Policy
#
########################################################
Write-Output "setting powershell local machine execution policy..."
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
Get-ExecutionPolicy -List
########################################################
#
#  Set network to private
#
# Required for WinRM firewall rules
########################################################
Write-Output "Set firewall to Private...."
$netProfile = Get-NetConnectionProfile
Set-NetConnectionProfile -Name $netProfile.Name -NetworkCategory Private -PassThru

########################################################
#
#  Enable WinRM
#
########################################################
Write-Output "enabling winRM service....."
Enable-PSRemoting -Force
Set-WSManInstance -ResourceURI winrm/config/service -ValueSet @{AllowUnencrypted="true";}
Set-WSManInstance -ResourceURI winrm/config/client -ValueSet @{AllowUnencrypted="true";}
Set-WSManInstance -ResourceURI winrm/config/service/auth -ValueSet @{Negotiate="true";}
Set-WSManInstance -ResourceURI winrm/config/client/auth -ValueSet @{Negotiate="true";}
Set-WSManInstance -ResourceURI winrm/config/client -ValueSet @{TrustedHosts="*";}
Enable-NetFirewallRule -DisplayGroup "Windows Remote Management" -PassThru
Get-NetFirewallRule -DisplayGroup "Windows Remote Management" | Get-NetFirewallAddressFilter | Where-Object { $_.RemoteAddress -Like "LocalSubnet*" } | Get-NetFirewallRule | Set-NetFirewallRule -RemoteAddress Any
Set-NetFirewallRule -DisplayName "Windows Remote Management (Http-In)" -EdgeTraversalPolicy Allow -Confirm:$false -PassThru

########################################################
#
#  Enable RDP
#
########################################################
Write-Output "Enabling RDP...."
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop" -PassThru

########################################################
#
#  Enable Ping
#
########################################################
Write-Output "Enabling ping...."
Enable-NetFirewallRule -DisplayGroup "Core Networking Diagnostics" -PassThru

########################################################
#
#  Set Region + Language
#
########################################################
Write-Output "Setting Region and Language...."
Set-WinSystemLocale en-AU
Set-WinHomeLocation -GeoId 12
Set-Culture en-AU
Set-WinUserLanguageList en-AU -Force

########################################################
#
#  Set Power Options
#
########################################################
Write-Output "Setting Power Options...."
powercfg.exe -x -monitor-timeout-ac 0
powercfg.exe -x -monitor-timeout-dc 0
powercfg.exe -x -disk-timeout-ac 0
powercfg.exe -x -disk-timeout-dc 0
powercfg.exe -x -standby-timeout-ac 0
powercfg.exe -x -standby-timeout-dc 0
powercfg.exe -x -hibernate-timeout-ac 0
powercfg.exe -x -hibernate-timeout-dc 0

########################################################
#
#  Reset Auto Logon Count
#
# https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-shell-setup-autologon-logoncount#logoncount-known-issue
########################################################
Write-Output "Resetting auto logon count...."
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name AutoLogonCount -Value 0  -PassThru
########################################################
#
#  Finalise
#
########################################################
Write-Output "Auto Unattend Script Completed..."
Stop-Transcript
