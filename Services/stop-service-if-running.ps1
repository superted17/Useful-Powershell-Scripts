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
 
 CheckService "Service Name"