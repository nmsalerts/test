<?php

session_start();

if(!isset[$_SESSION['user_id']]) {
	header("Location: logout.php");
	exit;


}

echo '"Welcome to the Dashboard!" <a href="logout.php">LOgout</a>';

?>
