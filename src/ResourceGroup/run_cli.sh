#!/bin/bash

echo "Resource Group Creator - Bicep"

if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

if [[ $# -ne 2 ]]; then
    echo 'Too many/few arguments, expecting two' >&2
    exit 1
fi

az deployment sub create \
  --what-if \
  --name demoSubDeployment \
  --location northeurope \
  --template-file resourceGroup.bicep \
  --parameters resourceGroupName=$1 resourceGroupLocation=$2

# az deployment group create --resource-group $1 --template-file ./main.bicep --parameters location=$2
# az deployment sub create \
#   --name demoSubDeployment \
#   --location northeurope \
#   --template-file resourceGroup.bicep \
#   --parameters resourceGroupName=$1 resourceGroupLocation=$2

echo "Complete!"

# way to run ./run_cli.sh exampleRG northeurope  
# test to run 
