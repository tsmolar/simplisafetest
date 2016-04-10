#!/bin/bash

# This script is intended to be passed to a new EC2 instance via the --user-data
# or --user-data-file parameter

yum update -y

# php will install apache as one of its dependancies, so I didn't list it separately
sudo yum -y install php
sudo yum -y install git
sudo service httpd stop
sudo service httpd start

# set up auto-start for web server
sudo chkconfig httpd on

# clone git repo and drop the php program into the apache document root
cd $HOME
git clone https://github.com/tsmolar/simplisafetest.git
sudo cp simplisafetest/ipaddr.php /var/www/html/
