// Access and define a resource group in the subscription scope
targetScope='subscription'

@description('Security Type of the Virtual Machine.')
param resourceGroupName string
@description('Security Type of the Virtual Machine.')
param location string

@description('Security Type of the Virtual Machine.')
@allowed([
  'NonProd'
  'Prod'
])
param environmentType string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

// Deploying storage account using module
module stg './storage.bicep' = {
  name: 'storageDeployment'
  scope: resourceGroup    // Deployed in the scope of resource group we created above
  params: {
    storageAccountName: 'stcontoso'
  }
}

