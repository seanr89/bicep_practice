#!/bin/bash

echo "Function Creator"

if [[ ! -n $1 ]];
then 
    echo "No parameter passed."
else
    echo "Parameter passed = $1"
fi

az deployment group create $1 --resource-group bibsRG --template-file function.bicep
# az deployment group create --resource-group bibsRG --template-file function.bicep --parameters appInsightsLocation=<app-location>

echo 'Run complete!'