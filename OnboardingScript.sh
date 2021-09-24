 # Add the service principal application ID and secret here
servicePrincipalClientId="283d9ef1-ab67-4050-ae54-810f3501014f"
servicePrincipalSecret="9f5d8c13-03ef-4e8f-bc33-1b95546b3dd8"

# Download the installation package
wget https://aka.ms/azcmagent -O ~/install_linux_azcmagent.sh

# Install the hybrid agent
bash ~/install_linux_azcmagent.sh

# Run connect command
azcmagent connect --service-principal-id "$servicePrincipalClientId" --service-principal-secret "$servicePrincipalSecret" --resource-group "we-AzureArc" --tenant-id "97c77cf4-3a62-4bd4-881e-32571196f806" --location "westeurope" --subscription-id "07293f17-f22b-4b98-8a2d-c4093157eca6" --cloud "AzureCloud" --correlation-id "d11b5f7b-4202-4f7c-9f31-7193ceb9e00b"

if [ $? = 0 ]; then echo "\033[33mTo view your onboarded server(s), navigate to https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.HybridCompute%2Fmachines\033[m"; fi
