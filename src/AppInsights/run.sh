#!/bin/bash

echo "Insights Creator"

if [[ ! -n $1 ]];
then 
    echo "No parameter passed."
else
    echo "Parameter passed = $1"
fi

az deployment group create $1 --resource-group bibsRG --template-file insights.bicep


echo 'Run complete!'