#!/bin/bash

echo "Subscription Selection"

az account set --subscription

az resource list --output table

echo "Complete!"

