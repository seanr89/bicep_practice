#!/bin/bash

echo "Subscription Selection"

az account set --subscription 51

az resource list --output table

echo "Complete!"

