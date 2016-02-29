/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-03-16
 * Email: jostmey@gmail.com
 * Purpose: Fetch the latest items from the queue.
 * License: This content is released under the MIT License.
 */

/**
 * Global variables listed here.
 * @var integer last_update stores the timestamp of the last request made to the web-server hosting the plugin.
 * @var integer update_interval determines the number of seconds between each request made to the web-server.
 * @var array items stores the items to render in the feed.
 */

var btceconomy_plugin_last_update=-1;
var btceconomy_plugin_update_interval=15;
var btceconomy_plugin_items=new Array();

/**
 * Method retrieves latest items from the server hosting the plugin, after which it makes a delayed call
 * back to itself. This creates an iterative loop that continually grabs the latest messages.
 */
function btceconomyPluginUpdate()
{
	jQuery.getJSON(
		"http://api.searchbitcoin.com/services/economy?callback=?",
		{
			"timestamp": btceconomy_plugin_last_update
		},
		function(data)
		{
			btceconomy_plugin_last_update=data["timestamp"];
			jQuery.each(
				data["items"],
				function(index, item)
				{
					var item_index=btceconomy_plugin_items.length;
					btceconomy_plugin_items[btceconomy_plugin_items.length]=item;
					setTimeout(
						"btceconomyPluginPostItem("+item_index+")",
						(item['dt'] > 0 ? item['dt'] : 0)*1000
					);
				}
			);
		}
	).error(
		function()
		{
			btceconomyPluginPostError("JSON Failed");
		}
	).complete(
		function()
		{
			setTimeout("btceconomyPluginUpdate()", btceconomy_plugin_update_interval*1000);
			btceconomyPluginStart();
		}
	);
}

/**
 * Entry point for the script.
 */
jQuery(document).ready(
	function()
	{
		btceconomyPluginInitialize();
		btceconomyPluginUpdate();
	}
);
