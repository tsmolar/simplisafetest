<html>
<!-- find and display IP address of the user who hits this page -->

<?php
 $myip=exec('ifconfig eth0 | grep "inet addr" | cut -d: -f2 | cut -d " " -f 1');

  echo "Your IP address is $myip";

?>

