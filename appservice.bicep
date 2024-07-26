resource ASP01 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: 'App-service-plan01'
  location: 'eastus'
  sku: {
    name: 'B1'
  }
}
