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
    // network: {
    //   delegatedSubnetResourceId: (empty(virtualNetworkExternalId) ? json('null') : json('\'${virtualNetworkExternalId}/subnets/${subnetName}\''))
    //   privateDnsZoneArmResourceId: (empty(virtualNetworkExternalId) ? json('null') : privateDnsZoneArmResourceId)
    // }
    highAvailability: {
      mode: haMode
    }
    storage: {
      storageSizeGB: skuSizeGB
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    availabilityZone: availabilityZone
  }
}

resource symbolicname 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2023-03-01-preview' = {
  name: 'ipRules/AllowAll'
  properties: {
    endIpAddress: '255.255.255.255'
    startIpAddress: '0.0.0.0'
  }
}
