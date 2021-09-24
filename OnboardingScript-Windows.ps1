# Add the service principal application ID and secret here
$servicePrincipalClientId="<ENTER APP ID>"
$servicePrincipalSecret="<ENTER SECRET HERE>"

# Download the package
function download() {$ProgressPreference="SilentlyContinue"; Invoke-WebRequest -Uri https://aka.ms/AzureConnectedMachineAgent -OutFile AzureConnectedMachineAgent.msi}
download

# Install the package
$exitCode = (Start-Process -FilePath msiexec.exe -ArgumentList @("/i", "AzureConnectedMachineAgent.msi" ,"/l*v", "installationlog.txt", "/qn") -Wait -Passthru).ExitCode
if($exitCode -ne 0) {
    $message=(net helpmsg $exitCode)
    throw "Installation failed: $message See installationlog.txt for additional details."
}

# Run connect command
& "$env:ProgramW6432\AzureConnectedMachineAgent\azcmagent.exe" connect --service-principal-id "$servicePrincipalClientId" --service-principal-secret "$servicePrincipalSecret" --resource-group "we-AzureArc" --tenant-id "XXXXXXXXXXXXXXXXXXXXXXXXX" --location "westeurope" --subscription-id "XXXXXXXXXXXXXXXXXXXXXXXXX" --cloud "AzureCloud" --tags "Datacenter=Maison,City=LYON,StateOrDistrict=RHONE,CountryOrRegion=FRANCE" --correlation-id "1848f605-06f2-4c5d-9eee-8128684f8000"

if($LastExitCode -eq 0){Write-Host -ForegroundColor yellow "To view your onboarded server(s), navigate to https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.HybridCompute%2Fmachines"}