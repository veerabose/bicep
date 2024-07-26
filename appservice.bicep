//App Service Plan

resource ASP01 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: 'App-service-plan01'
  location: 'eastus'
  sku: {
    name: 'B1'
  }
}

// Appservice

resource appservice 'Microsoft.Web/sites@2023-12-01' = {
  name: 'webapp01-27july24'
  location: 'eastus'
properties: {
  ASP01Id: ASP01.id
}
}

// websetting

resource appsetting 'Microsoft.Web/sites/config@2023-12-01' = {
  parent: appservice
  name: 'appsettings'
  properties: {
    enableAwesomeFeature: 'true'
  }
}
