<?php

	$file=filter_input(
		INPUT_GET,
		'file',
		FILTER_SANITIZE_STRING,
		FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH
	);
	header("Content-type: application/force-download");
	header("Content-Transfer-Encoding: Binary");
	header("Content-length: ".filesize($file));
	header("Content-disposition: attachment; filename=\"".basename($file)."\"");
	readfile($file);

