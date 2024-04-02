#!/bin/bash

echo "Postgres Start"

az postgres flexible-server start  --resource-group bibsRg --name bibspostserver

echo 'Run complete!'