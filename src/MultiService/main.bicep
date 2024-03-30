// Access and define a resource group in the subscription scope
targetScope='subscription'

@description('Name of the resource to create.')
param resourceGroupName string

@description('Location/region of the resource to be deployed.')
@allowed([
  'northeurope'
  'southeurope'
])
param location string

@description('Security Type of the Virtual Machine.')
@allowed([
  'NonProd'
  'Prod'
])
param environmentType string

@description('Security Type of the Virtual Machine.')
param storageAccountName string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

// Deploying storage account using module
module stg './storage.bicep' = {
  name: 'storageDeployment'
  scope: resourceGroup    // Deployed in the scope of resource group we created above
  params: {
    storageAccountName:  storageAccountName
    location: location
  }
}

