

# Create a scheduled task to run the PowerShell script at logon
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument $url = "https://mycontainer10.blob.core.windows.net/shrecontainer10/chrome download.ps1"
$outputPath = "C:\Path\To\DownloadedFile.txt"

Invoke-WebRequest -Uri $url -OutFile $outputPath

$Trigger = New-ScheduledTaskTrigger -AtLogOn
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings -Force


# Save the script to a file
$TaskScript | Out-File -FilePath "C:\Users\shres.DESKTOP-65UTNQT\OneDrive\Desktop\transcript" -Force