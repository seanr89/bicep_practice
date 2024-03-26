/*
Define and Create Azure Resource Group
@param {string} resourceGroupName - Name of the resource group
@param {string} resourceGroupLocation - Location of the resource group
*/

// Access and define a resource group in the subscription scope
targetScope='subscription'

@description('Required - Resource Group Name')
param resourceGroupName string
@description('Required - Resource Group Location')
@allowed([
  'eastus'
  'northeurope'
])
param resourceGroupLocation string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}
