GNU nano 8.7                                                              rg-ops-foundation.sh                                                              Modified
#!/bin/bash

    #  Define Variable
RG="rg-ops-foundation-weu"
LOCATION="westeurope"


  #  Log What to create
echo "Resources Group: $RG"
echo "Location: $LOCATION"
echo "Creating Resource Group..."

  #   Create Resource  Group
az group create --name $RG --location #LOCATION


  #   Confirming Message
echo "Resource Group Creation command executed successfully."


  #  Deleting a  Resource Group
# az group delete --name $RG --yes --no-wait
