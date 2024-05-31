# Define the download URL for the latest version of Google Chrome
$ChromeDownloadUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"

# Define the installation directory for Google Chrome
$ChromeInstallDir = "$env:ProgramFiles\Google\Chrome"

# Check if Google Chrome is already installed
if (Test-Path $ChromeInstallDir) {
    Write-Host "Google Chrome is already installed on this system."
} else {
    # Download the Google Chrome installer
    $ChromeInstallerPath = "$env:TEMP\chrome_installer.exe"
    Invoke-WebRequest -Uri $ChromeDownloadUrl -OutFile $ChromeInstallerPath

    # Install Google Chrome silently
    Start-Process -FilePath $ChromeInstallerPath -ArgumentList "/silent /install" -Wait

    # Clean up the installer file
    Remove-Item -Path $ChromeInstallerPath -Force
}

# Set the task name and script path
$taskName = "MyLogonTask"
$scriptPath = "C:\scripts\my_script.ps1"

# Create the scheduled tasks
$trigger = New-ScheduledTaskTrigger -AtLogon
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $scriptPath"
$task = New-ScheduledTask -Action $action -Trigger $trigger
Register-ScheduledTask -TaskName $taskName -InputObject $task