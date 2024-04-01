#!/bin/bash

echo "Postgres Creator"

if [[ ! -n $1 ]];
then 
    echo "No parameter passed."
else
    echo "Parameter passed = $1"
fi

# az group create --name bibsRG --location northeurope
az deployment group create $1 --resource-group bibsRG --template-file postgres-flex.bicep
# az deployment group create --resource-group bibsRG --template-file postgres-flex.bicep

echo 'Run complete!'