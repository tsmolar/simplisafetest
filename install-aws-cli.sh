#!/bin/bash

clear

echo "Important!  this script must be run with sudo/root access; It is needed to make changes to /usr/local"
echo ""
echo "AWS command line tool will be downloaded and install to /usr/local/aws and /usr/local/bin"
echo ""
echo "You will need about 700mb free for temporary use to download this package, and 40mb free on /usr/local"
echo "To install it"
echo ""
echo "To uninstall, remove /usr/local/aws and /usr/local/bin/aws"
echo ""
echo ""
echo ""
echo ""

if [ -d /usr/local/aws ]; then
  echo "There appears to already be an aws installation in /usr/local/aws, do you wish to proceed? (y/N)"
  read x
  if [ "$(echo $x | tr [a-z] [A-Z])" != "Y" ]; then
    exit
  fi
  echo ""
fi

echo "Are you sure you want to install aws tools? (y/N)"
read x

if [ "$(echo $x | tr [a-z] [A-Z])" != "Y" ]; then
  exit
fi


echo ""
echo "Downloading awscli-bundle.zip"
echo "-----------------------------"

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
if [ $? -ne 0 ]; then echo "Error downloading"; exit 1; fi

echo ""
echo "Extracting awscli-bundle.zip"
echo "----------------------------"

unzip awscli-bundle.zip
if [ $? -ne 0 ]; then echo "Error extracting"; exit 1; fi

echo ""
echo "Installing awscli-bundle"
echo "------------------------"

./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
if [ $? -ne 0 ]; then echo "Error installing"; exit 1; fi

echo ""
echo "Cleaning up installation files"
echo "------------------------------"
rm -rf awscli-bundle
rm awscli-bundle.zip
