[CmdletBinding()]
param (
    $vnetRgName = "RG_Vikas.Pandey",
    $vnet       = "vnet-weu-xxxx-azpipelinetest01",
    $vnetCIDR   = '192.171.0.0/16' 
)
$location   = (Get-AzResourceGroup -Name "$($vnetRgName)").Location

# Create a virtual network
$vnet = New-AzVirtualNetwork -ResourceGroupName $vnetRgName -Location $location `
    -Name $vnet -AddressPrefix $vnetCIDR -Verbose -Force

Write-Output $vnet

