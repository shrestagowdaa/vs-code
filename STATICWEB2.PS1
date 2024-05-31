# Git installation
$gitInstallerUrl = "https://github.com/git-for-windows/git/releases/download/v2.34.1.windows.1/Git-2.34.1-64-bit.exe"
$gitInstallerPath = "$env:TEMP\GitInstaller.exe"

# Download Git installer
Invoke-WebRequest -Uri $gitInstallerUrl -OutFile $gitInstallerPath

# Install Git silently
Start-Process -FilePath $gitInstallerPath -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /DIR=`"C:\Program Files\Git`"" -Wait

# Install IIS
Add-WindowsFeature Web-Server

# Define variables
$repoUrl = "https://github.com/shrestagowdaa/my-first-static-web-app.git"
$localPath = "C:\tempr"
$iisPath = "C:\inetpub\wwwroot"
$gitPath = "C:\Program Files\Git\bin\git.exe"

# Clone the GitHub repository using the specified Git executable path
& $gitPath clone $repoUrl $localPath

# Copy the contents of the repository to the IIS directory
Copy-Item -Path "$localPath\src\*" -Destination $iisPath -Recurse -Force

# Configure IIS to serve the website from the directory
New-WebVirtualDirectory -Site "Default Web Site" -Name "MyStaticSite" -PhysicalPath $iisPath

# Restart IIS to apply changes
Restart-Service W3SVC
