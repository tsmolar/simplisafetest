#!/bin/bash

# launches a new AMI instance, installs git, php, apache-httpd and the ipaddr.php program.
# will return the address to connect to this new instance

AMI_id="ami-22111148"  # Amazon Linux 03-2016
keypair="WebAppKeyPair"
securitygrp="webapp"
inst_type="t1.micro"

# launches an aws instance, but could not connect
aws ec2 run-instances --image-id $AMI_id --count 1 --instance-type $inst_type --key-name $keypair \
    --security-groups $securitygrp --user-data file://install-on-target.sh > instance-info.txt
    
instid=$(grep InstanceId instance-info.txt  | awk '{print $2}' | cut -d\" -f 2)

echo "Created an instance with the id of '$instid'"
echo
echo "Waiting for Public IP address to be assigned to instance..."

dnsname=""

while [ "$dnsname" = ""  ]; do
  dnsname=$(aws ec2 describe-instances --instance-id $instid | grep PublicDns | head -1 | awk '{print $2}' | cut -d\" -f2)
  sleep 3
done

ip=$(aws ec2 describe-instances --instance-id $instid | grep PublicIp | head -1 | awk '{print $2}' | cut -d\" -f2)

echo
echo "To connect to this ip check app on this instance: (may take a couple minutes to be fully online)"
echo 
echo "http://${dnsname}/ipaddr.php   or   http://${ip}/ipaddr.php"
echo
echo "ssh access:   ssh -i <your private key> ec2-user@${ip}"
