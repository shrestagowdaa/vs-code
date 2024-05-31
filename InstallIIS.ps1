# Install IIS
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Open port 80 in the Windows Firewall for HTTP traffic
New-NetFirewallRule -Name "HTTP" -DisplayName "HTTP" -Protocol TCP -LocalPort 80 -Action Allow -Enabled True

# Start the World Wide Web Publishing Service (IIS)
Start-Service W3SVC