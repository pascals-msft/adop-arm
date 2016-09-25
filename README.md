# adop-arm
ADOP Azure Resource Manager Template

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fpascals-msft%2Fadop-arm%2Fraw%2Fmaster%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>

The above button will deploy the Accenture DevOps Platform (ADOP) to the Microsoft Azure cloud platform.

You can find ADOP here: https://github.com/Accenture/adop-docker-compose

This template was initially inspired by: https://github.com/marrobi/AccentureDOP

Parameters:

- adminUsername: User name for the Virtual Machine and ADOP
- adminPassword: Password for the Virtual Machine and ADOP, must be > 8 chars and have number, etc.
- dnsNamePrefix: Globally unique DNS Name for the Public IP used to access the Virtual Machine.
- vmName: VM name. Default: "adop"
- vmSize: VM size. Default: "Standard_DS3_V2"

