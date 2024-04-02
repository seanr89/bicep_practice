#!/bin/bash

echo "Container App Creator"

if [[ ! -n $1 ]];
then 
    echo "No parameter passed."
else
    echo "Parameter passed = $1"
fi

# az group create --name bibsRG --location northeurope

echo 'Run complete!'