param administratorLogin string = 'bibsUser'

@secure()
param administratorLoginPassword string = 'ChangeYourAdminPassword1'
param location string = resourceGroup().location
param serverName string = 'bibspostserver'
param serverEdition string = 'Burstable'
param skuSizeGB int = 32
param dbInstanceType string = 'Standard_B1ms'
param haMode string = 'Disabled'
param availabilityZone string = 'Disabled'
param version string = '16'
// param virtualNetworkExternalId string = ''
// param subnetName string = ''
// param privateDnsZoneArmResourceId string = ''

resource serverName_resource 'Microsoft.DBforPostgreSQL/flexibleServers@2023-03-01-preview' = {
  name: serverName
  location: location
  sku: {
    name: dbInstanceType
    tier: serverEdition
  }
  properties: {
    version: version
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    createMode: 'Default'
    // network: {
    //   delegatedSubnetResourceId: (empty(virtualNetworkExternalId) ? json('null') : json('\'${virtualNetworkExternalId}/subnets/${subnetName}\''))
    //   privateDnsZoneArmResourceId: (empty(virtualNetworkExternalId) ? json('null') : privateDnsZoneArmResourceId)
    // }
    // highAvailability: {
    //   mode: haMode
    // }
    storage: {
      storageSizeGB: skuSizeGB
      tier: 'P4'
      autoGrow: 'Disabled'
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
  }
  // resource firewallAzure 'firewallRules' = {
  //   name: 'allow-all-azure-internal-IPs'
  //   properties: {
  //       startIpAddress: '0.0.0.0'
  //       endIpAddress: '0.0.0.0'
  //   }
  // }
  resource firewallAzureExternal 'firewallRules' = {
    name: 'allow-all-IPs'
    properties: {
        startIpAddress: '0.0.0.0'
        endIpAddress: '255.255.255.255'
    }
  }
}

// resource symbolicname 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2023-03-01-preview' = {
//   name: 'ipRules/AllowAll'
//   properties: {
//     endIpAddress: '255.255.255.255'
//     startIpAddress: '0.0.0.0'
//   }
// }

// resource dbServerMaxConnections 'Microsoft.DBforPostgreSQL/flexibleServers/configurations@2021-06-01' = {
//   parent: dbServer
//   name: 'max_connections'
//   properties: {
//     value: '100'
//     source: 'user-override'
//   }
// }
