# This function will retrieve a list of services that match the ServiceName (NOT the DisplayName)
# It will then check if the matching services are stopped
# If they are stopped, they will be started
# If they are started, they will be left as they are

function StartServiceIfStopped{
	param($ServiceName)
	
	$arrService = Get-Service -Name $ServiceName
	
	if ($arrService.Status -ne "running"){
		Start-Service $ServiceName
		Write-Host "Starting " $ServiceName " service" 
	}
	
	if ($arrService.Status -eq "running"){ 
		Write-Host "$ServiceName service is already running"
	}
 }
 
 # Usage:
 StartServiceIfStopped "YourServiceName"