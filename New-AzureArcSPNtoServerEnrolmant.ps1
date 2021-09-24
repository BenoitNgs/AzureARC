Import-Module -Name Az.Resources
Import-Module -Name Az.Accounts

$strSubID = "07293f17-f22b-4b98-8a2d-c4093157eca6"

$param = @{
    DisplayName = "spn-zurearc-enrolment-servers";
    Role = "Azure Connected Machine Onboarding"
    Scope = "/subscriptions/$strSubID"
    EndDate = $(Get-Date).AddMonths(1)
}

Connect-AzAccount 
Set-AzContext -Subscription $strSubID

$objSPN = New-AzADServicePrincipal @param
$credential = New-Object pscredential -ArgumentList "temp", $objSPN.Secret

Write-Warning "AppID: $objSPN.ApplicationId"
Write-Warning "AppSecret: $($credential.GetNetworkCredential().password)"