# Download Google Chrome installer
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/GoogleChromeStandaloneEnterprise64.msi" -OutFile "$env:TEMP\ChromeInstaller.msi"

# Install Google Chrome silently
Start-Process -FilePath "$env:TEMP\ChromeInstaller.msi" -ArgumentList "/qn /norestart" -Wait

# Remove the downloaded installer
Remove-Item "$env:TEMP\ChromeInstaller.msi"
