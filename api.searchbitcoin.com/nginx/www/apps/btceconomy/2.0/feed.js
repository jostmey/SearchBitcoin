/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-03-17
 * Email: jostmey@gmail.com
 * Purpose: Handle rendering and animation of newly received items.
 * License: This content is released under the MIT License.
 */

function btceconomyPluginPreloadImage(image)
{
	jQuery('<img/>').attr(
		'src', image
	).appendTo(
		jQuery('body').append('<div id="img-cache" style="display: none;"/>').children('#img-cache')
	);
}

function btceconomyPluginInitialize()
{
	btceconomyPluginPreloadImage("<?php echo require 'globals/base_url.php'; ?>/resources/cart-up.png");
	btceconomyPluginPreloadImage("<?php echo require 'globals/base_url.php'; ?>/resources/cart-down.png");
	btceconomyPluginPreloadImage("<?php echo require 'globals/base_url.php'; ?>/resources/glass-up.png");
	btceconomyPluginPreloadImage("<?php echo require 'globals/base_url.php'; ?>/resources/glass-down.png");
	btceconomyPluginPreloadImage("<?php echo require 'globals/base_url.php'; ?>/resources/btcheader-opaque.png");

	jQuery("a.btceconomy_plugin_middle_menu_submit").click(
		function()
		{
			btceconomyPluginFocusAddEntry();
		}
	);

	jQuery("a.btceconomy_plugin_middle_menu_embed").click(
		function()
		{
			btceconomyPluginFocusEmbed();
		}
	);
}

function btceconomyPluginStart()
{
	jQuery("div.btceconomy_plugin_loading").fadeOut(
		"slow",
		function()
		{
			jQuery("#btceconomy_plugin_main").fadeIn("fast");
		}
	);
}

function btceconomyPluginFocusAddEntry()
{
	jQuery("#btceconomy_plugin_focus").fadeOut(
		"slow",
		function()
		{
			jQuery("#btceconomy_plugin_focus").html(
				'<div class="btceconomy_plugin_focus_submit_info">'+
					'Promote your bitcoin merchandise or service for free<br/>'+
					'<a class="btceconomy_plugin_focus_submit_info" href="http://www.searchbitcoin.com/vendors/join" target="_top">Search Bitcoin</a>'+
				'</div>'
			).fadeIn("slow");
		}
	);
}

function btceconomyPluginFocusEmbed()
{
	jQuery("#btceconomy_plugin_focus").fadeOut(
		"slow",
		function()
		{
			jQuery("#btceconomy_plugin_focus").html(
				'<div class="btceconomy_plugin_focus_embed_instructions">'+
					'Copy and pase the following line into your webpage.'+
				'</div>'+
				'<input type="text" class="btceconomy_plugin_focus_embed_command" value="&lt;script type=&quot;text/javascript&quot; src=&quot;http://api.searchbitcoin.com/btceconomy&quot;&gt;&lt;/script&gt;">'+
				'<div class="btceconomy_plugin_focus_embed_support">'+
					'Support: <a href="mailto:searchbitcoin@gmail.com">searchbitcoin@gmail.com</a>'+
				'</div>'
			).fadeIn("slow");
			jQuery('.btceconomy_plugin_focus_embed_command').focus().select();
		}
	);
}

/**
 * @var integer btceconomyPluginFeedPanelMouseOver acts to indicate which user generate event has occurred so that it may be recorded
 *	to the database.
 * @var integer btceconomyPluginFeedFreeze acts to indicate if the feed should be froozen because the mouse is over one of the buttons.
 */
var btceconomyPluginFeedPanelMouseOver=0;
var btceconomyPluginFeedFreeze=0;

/**
 * Method called to display message in the focus area.
 * @var integer item_index indicates which function to display in the focus area.
 */
function btceconomyPluginFocusItem(item_index)
{
	var id=btceconomy_plugin_items[item_index]['id'];
	btceconomyPluginPreloadImage('<?php echo require 'globals/base_url.php'; ?>/image_fetch.php?x=100&y=100&id='+id);
	jQuery("#btceconomy_plugin_focus").fadeOut(
		"slow",
		function()
		{
			jQuery("#btceconomy_plugin_focus").html(
				'<div class="btceconomy_plugin_focus_item">'+
					'<a class="btceconomy_plugin_focus_button_buy" href="'+btceconomy_plugin_items[item_index]['url']+'" target="_blank" onmouseover="btceconomyPluginFeedPanelMouseOver=2;" onmouseout="btceconomyPluginFeedPanelMouseOver=0;"></a>'+
					'<img class="btceconomy_plugin_focus_item_image" src="http://api.searchbitcoin.com/services/image/'+id+'/large"/>'+
					'<div class="btceconomy_plugin_focus_item_title">'+
						btceconomy_plugin_items[item_index]['title']+
					'</div>'+
					'<div class="btceconomy_plugin_focus_item_domain">'+
						'Brought to you by '+
						'<a class="btceconomy_plugin_focus_item_domain" href="'+btceconomy_plugin_items[item_index]['url']+'"  target="_blank" onmouseover="btceconomyPluginFeedPanelMouseOver=1;" onmouseout="btceconomyPluginFeedPanelMouseOver=0;">'+
							btceconomy_plugin_items[item_index]['domain']+
						'</a>'+
					'</div>'+
					'<div class="btceconomy_plugin_focus_item_description">'+
						btceconomy_plugin_items[item_index]['description']+
					'</div>'+
				'</div>'
			).fadeIn("slow");
		}
	);
}

/**
 * Method called to post the latest message in the feed.
 * @var integer item_index indicates which message to add into the feed.
 */
function btceconomyPluginPostItem(item_index)
{
	if(btceconomyPluginFeedFreeze)
		return;
	var id=btceconomy_plugin_items[item_index]['id'];
	jQuery(
		'<div class="btceconomy_plugin_feed_panel" onclick="btceconomyPluginFocusItem('+item_index+');">'+
			'<div class="btceconomy_plugin_feed_image">'+
				'<img class="btceconomy_plugin_feed_image" src="http://api.searchbitcoin.com/services/image/'+id+'"/>'+
			'</div>'+
			'<div class="btceconomy_plugin_feed_title">'+
				'<a onmouseover="btceconomyPluginFeedFreeze=1;" onmouseout="btceconomyPluginFeedFreeze=0;" class="btceconomy_plugin_feed_domain" href="'+btceconomy_plugin_items[item_index]['url']+'" target="_blank" onmouseover="btceconomyPluginFeedPanelMouseOver=1;" onmouseout="btceconomyPluginFeedPanelMouseOver=0;">'+
					btceconomy_plugin_items[item_index]['domain']+
				'</a>'+
				' - '+btceconomy_plugin_items[item_index]['title']+
			'</div>'+
			'<div class="btceconomy_plugin_feed_description">'+
				btceconomy_plugin_items[item_index]['description']+
			'</div>'+
			'<div onmouseover="btceconomyPluginFeedFreeze=1;" onmouseout="btceconomyPluginFeedFreeze=0;" class="btceconomy_plugin_feed_buttons">'+
				'<a class="btceconomy_plugin_feed_button_buy" href="'+btceconomy_plugin_items[item_index]['url']+'" target="_blank" onmouseover="btceconomyPluginFeedPanelMouseOver=2;" onmouseout="btceconomyPluginFeedPanelMouseOver=0;"></a>'+
				'<a class="btceconomy_plugin_feed_button_focus" onclick="btceconomyPluginFocusItem('+item_index+');"></a>'+
			'</div>'+
		'</div>'
	).hide().prependTo("#btceconomy_plugin_feed").slideDown("slow");

	jQuery(".btceconomy_plugin_feed_panel").each(
		function(index)
		{
			if(index >= 20)
			{
				jQuery(this).children().remove();
				jQuery(this).remove();
			}
		}
	);
}

/**
 * Method posts error message instead of a feed.
 * @var string error
 */
function btceconomyPluginPostError(error)
{
	jQuery(
		'<div>'+error+'</div>'
	).hide().prependTo("#btceconomy_plugin_feed").slideDown("slow");
}

