<?php 
if(!file_exists($path))
	echo "Invalid path to PHP script.";
else
	include $path;
?>
