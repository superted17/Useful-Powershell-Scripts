# This function will retrieve a list of services that match the ServiceName (NOT the DisplayName)
# It will then check if the matching services are running
# If they are running, they will be stopped
# If they are not running, they will be left as they are

function CheckService{
	param($ServiceName)
	
	$arrService = Get-Service -Name $ServiceName
	
	if ($arrService.Status -eq "Running"){
		Stop-Service $ServiceName
		Write-Host "Stopping " $ServiceName " service" 
	}
	
	if ($arrService.Status -ne "running"){ 
		Write-Host "$ServiceName service is already stopped"
	}
 }
 
 # Usage:
 CheckService "YourServiceName"