# adop-arm
ADOP Azure Resource Manager Template

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fpascals-msft%2Fadop-arm%2Fraw%2Fmaster%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>

The above button will deploy the Accenture DevOps Platform (ADOP) to the Microsoft Azure cloud platform.

Parameters:

- adminUsername: User name for the Virtual Machine and ADOP
- adminPassword: Password for the Virtual Machine and ADOP, must be >= 12 chars and have number, etc.
- dnsNamePrefix: Globally unique DNS Name for the Public IP used to access the Virtual Machine.
- vmName: VM name. Default: `adop`
- vmSize: VM size. Default: `Standard_DS3_V2`

To deploy interactively, click the above button.

To deploy in an interactive command line using Azure CLI :

```
azure group create <my-resource-group> <azure-location>
azure group deployment create <my-resource-group> <my-deployment-name> --template-uri https://github.com/pascals-msft/adop-arm/raw/master/azuredeploy.json
```

To deploy without interaction, download `azuredeploy.json` and `azuredeploy.parameters.json`, edit the latter with your parameter values and run:

```
azure group create <my-resource-group> <azure-location>
azure group deployment create <my-resource-group> <my-deployment-name> -f azuredeploy.json -e azuredeploy.parameters.json
```

For more information:

- You can find ADOP here: https://github.com/Accenture/adop-docker-compose.
- This template was initially inspired by: https://github.com/marrobi/AccentureDOP
