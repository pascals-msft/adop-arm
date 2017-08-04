# adop-arm
ADOP Azure Resource Manager Template

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fpascals-msft%2Fadop-arm%2Fraw%2Fmaster%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>

The above button will deploy the Accenture DevOps Platform (ADOP) to the Microsoft Azure cloud platform.

Parameters:

- adminUsername: User name for the Virtual Machine and ADOP
- adminPassword: Password for the Virtual Machine and ADOP, must be >= 12 chars and have letters, symbols, numbers, etc.
- dnsNamePrefix: Globally unique DNS Name for the Public IP used to access the Virtual Machine.
- vmName: VM name. Default: `adop`.
- vmSize: VM size. Default: `Standard_DS3_V2`.
- osDistribution: Linux Distribution and version to install in the VM. Possible values: `UbuntuServer1404LTS`, `UbuntuServer1604LTS`, `RHEL72`, `RHEL73`. Default: `UbuntuServer1604LTS`.

To deploy interactively, click the above button.

To list available sizes, with Azure CLI: `az vm list-sizes --location <azure-location>`

To list available locations: `az account list-locations`

To deploy in an interactive command line using Azure CLI :

```
az group create -n <my-resource-group> -l <azure-location>
az group deployment create -g <my-resource-group> --template-uri https://github.com/pascals-msft/adop-arm/raw/master/azuredeploy.json --nowait
```

To deploy without interaction, download `azuredeploy.json` and `azuredeploy.parameters.json`, edit the latter with your parameter values and run:

```
az group create -n <my-resource-group> -l <azure-location>
az group deployment create -g <my-resource-group> --template-file azuredeploy.json --parameters @azuredeploy.parameters.json --nowait
```

To see the status of the deployment you can use the portal or this command:
```
az group deployment list -g <my-resource-group>
```

Once the deployment ends (after usually between 15 than 20 minutes), you can access the ADOP portal on the deployment's siteUri output, which looks like: `http://<dnsNamePrefix>.<azure-location>.cloudapp.azure.com`.

For more information:

- You can find Microsoft Azure CLI 2.0 (az) here: https://github.com/Azure/azure-cli.
- You can find ADOP here: https://github.com/Accenture/adop-docker-compose.
- This template was initially inspired by: https://github.com/marrobi/AccentureDOP

To do:
- The tempalte's result lacks security. We should add at least a load balancer and a NSG --will do ASAP.
