#!/bin/bash

echo "Postgres Stop"

az postgres flexible-server stop  --resource-group bibsRg --name bibspostserver

echo 'Run complete!'