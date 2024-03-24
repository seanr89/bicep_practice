#!/bin/bash

echo "Resource Group Creator"

if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

if [[ $# -ne 2 ]]; then
    echo 'Too many/few arguments, expecting two' >&2
    exit 1
fi

az group create --name $1 --location $2

echo "Complete!"
