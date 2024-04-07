@description('The name of the function app that you wish to create.')
param appName string = 'fnapp-insights'

@description('Location for Application Insights')
param appInsightsLocation string = 'northeurope'

var applicationInsightsName = appName

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: appInsightsLocation
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Request_Source: 'rest'
  }
}
