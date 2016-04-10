# simplisafetest

<b>Local environment set up</b>
<p>To bootstrap this process, you will need to Amazon aws CLI tool installed on your local system</pr>
<p>I have created a script named <i>install-aws-cli.sh</i> that will download and install this tool, if needed</p>

<p>after you run this script, prep your environment via the command '<i><b>aws configure</b></i>'.  This will prompt you for your Amazon authentication keys and default region (I did my work in 'us-east-1').  See http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration for more information.</p>

 
 <b>Security Preparations</b>
 <p>The script <i>security-prep.sh</i> will create a security group and keypair for use in instance creation, this script only needs to be run once.  If run multiple times, it will delete the previous keypair and recreate it, effectively locking anyone else using a previously generated key.  Be careful</p>
 
<b>Launch the Instance</b>
<p>Once your environment is set up with the command-line tool, and the security steps are complete, you can simply run the <i>launch-instance.sh</i> script.   This will spin up a new micro instance, install php, apache-httpd, git, and ipaddr.php.   It will report the instance ID and the web address and ssh address to connect to.</p>

<p>That's all there is to it!</p>

<b>Other scripts</b>
<p><i>launch-on-target.sh</i> is used by launch-instance to pass to the new instance via the --user-data parameter.  This will prep the environment and does not need to be run by the user.</p> 
