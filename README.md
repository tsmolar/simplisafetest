# simplisafetest
temp repository for simplisafe

<b>Local environment set up</b>
<p>To bootstrap this process, you will need to Amazon aws CLI tool installed on your local system</pr>
<p>I have created a script named install-aws-cli.sh that will download and install this tool, if needed</p>
 
 <b>Security Preparations</b>
 <p>The script security-prep.sh will create a security group and keypair for use in instance creation, this script only needs to be run once.  If run multiple times, it will delete the previous keypair and recreate it, effectively locking anyone else using a previously generated key.  Be careful</p>
 
<b>Launch the Instance</b>
<p>Once your environment is set up with the command-line tool, and the security steps are complete, you can simply run the <font face=courier>launch-instance.sh</font> script.   This will spin up a new micro instance, install php, apache-httpd, git, and ipaddr.php.   It will report the instance ID and the web address and ssh address to connect to.</p>

<p>That's all there is to it!</p>

<b>Other scripts</b>
<p><font face=courier>launch-on-target.sh</font> is used by launch-instance to pass to the new instance via the --user-data parameter.  This will prep the environment and does not need to be run by the user.</p> 
