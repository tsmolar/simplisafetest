# simplisafetest
temp repository for simplisafe

<b>Local environment set up</b>
<p>To bootstrap this process, you will need to Amazon aws CLI tool installed on your local system</pr>
<p>I have created a script named install-aws-cli.sh that will download and install this tool, if needed</p>
 
 <b>Security Preparations</b>
 <p>The script security-prep.sh will create a security group and keypair for use in instance creation, this script only needs to be run once.  If run multiple times, it will delete the previous keypair and recreate it, effectively locking anyone else using a previously generated key.  Be careful</p>


Installed local apache2/php to test myippr.php  can be called at http://localhost/ipaddr.php
