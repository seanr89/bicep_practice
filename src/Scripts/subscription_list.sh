#!/bin/bash

echo "Subscription Listing"

az account subscription list --output table

echo "Complete!"