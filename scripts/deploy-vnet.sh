#!/usr/bin/env bash

resource_group=${1:-'RG_Vikas.Pandey'}
location=${2:-westeurope}
vnet=${3:-'vnet-weu-dwlr-azpipelinetest02'}
vnet_address=${4:-192.174.0.0/16}

# Create a virtual network.
az.cmd network vnet create --name $vnet \
    --resource-group $resource_group \
    --address-prefix $vnet_address \
    --location $location \
    --verbose
