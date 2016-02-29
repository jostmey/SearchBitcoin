/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-03-16
 * Email: jostmey@gmail@com
 * Purpose: Script for loading additional javascript files.
 * License: This content is released under the MIT License.
 */


function btceconomyLoadScript(url)
{
	var script=document.createElement("script")
	script.type="text/javascript";
	script.src=url;
	document.body.appendChild(script);
}

btceconomyLoadScript('<?php echo require 'globals/base_url.php'; ?>/plugin.php');

