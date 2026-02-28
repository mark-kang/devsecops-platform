// main.bicep
param webAppName string
param location string = resourceGroup().location
param sku string = 'F1'
param linuxFxVersion string

// Azure Web App 이름은 전역 고유해야 함 → 리소스그룹 기반 해시 접미사 추가
var uniqueSuffix = substring(uniqueString(resourceGroup().id), 0, 6)
var fullWebAppName = '${webAppName}-${uniqueSuffix}'

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
// TODO: microsoft.insights 프로바이더 등록 후 아래 주석 해제
// az provider register --namespace microsoft.insights --wait
// resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
//   name: 'insights-${fullWebAppName}'
//   location: location
//   kind: 'web'
//   properties: {
//     Application_Type: 'web'
//   }
// }

// 3. Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: fullWebAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      // appSettings: [
      //   {
      //     name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
      //     value: appInsights.properties.InstrumentationKey
      //   }
      // ]
    }
  }
}

output webAppName string = fullWebAppName
output webAppUrl string = 'https://${webApp.properties.defaultHostName}'