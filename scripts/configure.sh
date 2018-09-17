#!/bin/bash

#############
# Parameters
#############
AZUREUSER=$1
ARTIFACTS_URL_PREFIX=$2
DNS_NAME=$3

###########
# Constants
###########
HOMEDIR="/home/$AZUREUSER";

################################################################
# Install MultiChain using regular steps, cleaning up at the end
################################################################
cd $HOMEDIR
wget https://www.multichain.com/download/multichain-latest.tar.gz
tar -xvzf multichain-latest.tar.gz
cd multichain-*
sudo mv multichaind multichain-cli multichain-util multichaind-cold /usr/local/bin
mv README.txt ..
cd ..
rm -fr multichain-*

############################################################
# Add external IP address to global MultiChain configuration
############################################################
cd $HOMEDIR
mkdir .multichain
cd .multichain
echo externalip=$DNS_NAME > multichain.conf
cd ..
chown -R $AZUREUSER:$AZUREUSER .multichain
