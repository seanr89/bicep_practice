// =========== storage.bicep =========== //
targetScope = 'resourceGroup' // -  this is default value

param storageAccountName string
param location string = resourceGroup().location

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
