#!/bin/bash

echo "Postgres Destror"

az postgres flexible-server db delete --resource-group bibsRG --server-name bibspostserver --database-name postgres

echo 'Run complete!'