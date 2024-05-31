# Download Google Chrome installer
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/GoogleChromeStandaloneEnterprise64.msi" -OutFile "$env:TEMP\ChromeInstaller.msi"

# Install Google Chrome silently
Start-Process -FilePath "$env:TEMP\ChromeInstaller.msi" -ArgumentList "/qn /norestart" -Wait

# Remove the downloaded installer
Remove-Item "$env:TEMP\ChromeInstaller.msi"


# Create a scheduled task to run the PowerShell script at logon
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\Users\shres.DESKTOP-65UTNQT\OneDrive\Desktop\Untitled1.ps1"
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings -Force


# Save the script to a file
$TaskScript | Out-File -FilePath "C:\Users\shres.DESKTOP-65UTNQT\OneDrive\Desktop\transcript" -Force
