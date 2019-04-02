# Use dotnet-framework base image
FROM microsoft/dotnet-framework-build

# Download Matlab Compiler Runtime 2019a installer (self-extracting executable) and save as ZIP file
ADD http://ssd.mathworks.com/supportfiles/downloads/R2019a/Release/0/deployment_files/installer/complete/win64/MATLAB_Runtime_R2019a_win64.zip C:\\MATLAB_Runtime.zip

# Use PowerShell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install Matlab Compiler Runtime 2019a
RUN Expand-Archive C:\\MATLAB_Runtime.zip -DestinationPath C:\\MCR_INSTALLER; Start-Process C:\\MCR_installer.exe -ArgumentList '-mode silent', '-agreeToLicense yes' -Wait; Remove-Item -Force -Recurse C:\\MCR_INSTALLER, C:\\MATLAB_Runtime.zip
