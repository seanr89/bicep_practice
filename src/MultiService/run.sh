#!/bin/bash

echo "Resource Group Creator"

az deployment sub create \
  --what-if \
  --location northeurope \
  --name demoBulkDeployment \
  --template-file main.bicep \
  --parameters main.bicepparam

echo 'Run complete!'