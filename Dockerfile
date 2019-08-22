FROM mcr.microsoft.com/windows/servercore:1809

SHELL ["powershell"]
RUN $url = 'https://raw.githubusercontent.com/nospaceships/raw-socket-sniffer/master/raw-socket-sniffer.ps1' ; \
    Invoke-WebRequest -Uri $url -OutFile raw-socket-sniffer.ps1

CMD Write-Host "Capture started, press CTRL+C to end capture..." ; \
	PowerShell.exe -ExecutionPolicy bypass .\raw-socket-sniffer.ps1 -InterfaceIp $((Get-NetIPAddress -InterfaceAlias vEthernet* -AddressFamily IPv4 | Where {$_.IPAddress -like '10.0*'}).IPAddress) -CaptureFile /capture/capture.cap