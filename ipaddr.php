<html>
<!-- find and display IP address of the user who hits this page -->

<?php

  // Find IP by querying the _SERVER array
  $myip=$_SERVER['REMOTE_ADDR'];

  echo "<center>Your IP address is $myip</center>";
?>


</html>
