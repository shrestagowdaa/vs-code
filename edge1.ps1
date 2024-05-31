# Install Edge Insider Channel (Canary, Dev, Beta, or Stable)
$Channel = "Dev"  # Change this to the desired channel (Canary, Dev, Beta, or Stable)
$OSVersion = (Get-WmiObject -Class Win32_OperatingSystem).Caption
$EdgeInstaller = "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/07b1b59d-c4b1-430b-9931-68e3a715c8d0/MicrosoftEdgeInstaller.exe"  # URL for Edge installer, may need to be updated

# Download Edge Installer
$InstallerPath = "$env:TEMP\MicrosoftEdgeInstaller.exe"
Invoke-WebRequest -Uri $EdgeInstaller -OutFile $InstallerPath

# Install Edge
Start-Process -FilePath $InstallerPath -ArgumentList "--install", "--system-level", "--do-not-launch", "--msedge-source-url", "$EdgeInstaller" -Wait

# Launch Edge
Start-Process -FilePath "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

# Clean up the installer
Remove-Item $InstallerPath

