 # Add the service principal application ID and secret here
servicePrincipalClientId="<ENTER APP ID>"
servicePrincipalSecret="<ENTER SECRET HERE>"

# Download the installation package
wget https://aka.ms/azcmagent -O ~/install_linux_azcmagent.sh

# Install the hybrid agent
bash ~/install_linux_azcmagent.sh

# Run connect command
azcmagent connect --service-principal-id "$servicePrincipalClientId" --service-principal-secret "$servicePrincipalSecret" --resource-group "we-AzureArc" --tenant-id "XXXXXXXXXXXXXXXXXXXXXXXXX" --location "westeurope" --subscription-id "XXXXXXXXXXXXXXXXXXXXXXXXX" --cloud "AzureCloud" --correlation-id "d11b5f7b-4202-4f7c-9f31-7193ceb9e00b"

if [ $? = 0 ]; then echo "\033[33mTo view your onboarded server(s), navigate to https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.HybridCompute%2Fmachines\033[m"; fi
