// main.bicep
param webAppName string
param location string = resourceGroup().location
param sku string = 'B1'
param linuxFxVersion string

// 1. App Service Plan (Linux)
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'plan-${webAppName}'
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
}

// 2. Application Insights (Observability)
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'insights-${webAppName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

// 3. Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsights.properties.InstrumentationKey
        }
      ]
    }
  }
}