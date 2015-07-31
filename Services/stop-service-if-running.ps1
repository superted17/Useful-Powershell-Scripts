# This function will retrieve a list of services that match the ServiceName (NOT the DisplayName)
# It will then check if the matching services are started
# If they are started, they will be stopped
# If they are not started, they will be left as they are

function StopServiceIfStarted{
	param($ServiceName)
	
	$arrService = Get-Service -Name $ServiceName
	
	if ($arrService.Status -eq "running"){
		Stop-Service $ServiceName
		Write-Host "Stopping " $ServiceName " service" 
	}
	
	if ($arrService.Status -ne "running"){ 
		Write-Host "$ServiceName service is already stopped"
	}
 }
 
 # Usage:
 StopServiceIfStarted "YourServiceName"