#!/bin/bash

# This script only needs to be run once before spinning up new instances
# it will create a default security group "webapp"

# it will also create a default keypair named "WebAppKeyPair"

# Ensure our default group (webapp) exists
aws ec2 create-security-group --group-name webapp --description "Group for Simplisafe test"

# Recreate Key Pair
aws ec2 delete-key-pair --key-name WebAppKeyPair
aws ec2 create-key-pair --key-name WebAppKeyPair --query 'KeyMaterial' --output text > $HOME/.ssh/id_rsa-webapp
chmod 600 $HOME/.ssh/id_rsa-webapp

echo "A new private key has been created in $HOME/.ssh/id_rsa-webapp"
echo ""
echo "you must specify this key on ssh/scp commands with the -i id_rsa-webapp flag, or add it to your .ssh/config file"
echo "Alternatively, if this is your only key, you can rename it to id_rsa to make it the default key"
