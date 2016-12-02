export DEMO_NAME=demoadop2

cat <<EOF >$DEMO_NAME.parameters.json
{
  "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "adminUsername": {
      "value": "adopadmin"
    },
    "adminPassword": {
      "value": "Accenture..1"
    },
    "dnsNamePrefix": {
      "value": "$DEMO_NAME"
    },
    "vmName": {
      "value": "adop"
    },
    "vmSize": {
      "value": "Standard_DS3_v2"
    }
  }
}
EOF

azure group create $DEMO_NAME westeurope
azure group deployment create $DEMO_NAME azuredeploy --template-file azuredeploy.json --parameters-file $DEMO_NAME.parameters.json --nowait

echo Monitor deployment with these commands:
echo   azure group deployment show $DEMO_NAME azuredeploy
echo   azure group deployment operation list $DEMO_NAME azuredeploy
