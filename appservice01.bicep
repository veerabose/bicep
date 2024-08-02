//App Service Plan
@allowed([ 'test' , 'prod' ])
param envname string

param awesomeFeatureEnabled bool

@description('Please make sure you do not increase the count to much!')
@minValue(1)
@maxValue(5)
param awesomeFeatureCount int

@minLength(5)
@maxLength(25)
param awesomeFearuteDisaplyName string

// websetting

resource appsetting 'Microsoft.Web/sites/config@2023-12-01' = {
  parent: appservice
  name: 'appsettings'
  properties: {
    enableAwesomeFeature: string(awesomeFeatureEnabled)
    awesomeFeatureCount: string(awesomeFeatureCount)
    awesomeFearuteDisaplyName: awesomeFearuteDisaplyName
  }
}


resource ASP01 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: 'App-service-plan01-${envname}'
  location: 'eastus'
  sku: {
    name: 'B1'
  }
}

// Appservice

resource appservice 'Microsoft.Web/sites@2023-12-01' = {
  name: 'webapp01-27july27-${envname}'
  location: 'eastus'
  properties: {
    serverFarmId: ASP01.id
  }
}

//Veerabose test

