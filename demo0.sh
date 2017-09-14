if [ $# -lt 2 ]
then
  echo "Usage: $0 <demo_name> UbuntuServer1404LTS|UbuntuServer1604LTS|RHEL72|RHEL73"
  exit 1
fi

export DEMO_NAME=$1
export OS_DISTRIBUTION=$2
export AZURE_LOCATION=westeurope

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
    },
    "osDistribution": {
      "value": "$OS_DISTRIBUTION"
    }
  }
}
EOF

az group create -n $DEMO_NAME -l $AZURE_LOCATION
az group deployment create -g $DEMO_NAME --template-file azuredeploy.json --parameters @$DEMO_NAME.parameters.json --no-wait

echo
echo Monitor deployment with these commands:
echo   az group deployment list -g $DEMO_NAME
echo
echo When deployment is completed, open the ADOP website at:
echo   http://$DEMO_NAME.$AZURE_LOCATION.cloudapp.azure.com
