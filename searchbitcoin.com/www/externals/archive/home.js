/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-08-07
 * Email: jostmey@gmail.com
 * License: This content is released under the BSD License.
 */

/**
 * Class polls backend to create a live feed.
 */
$(function()
{
	/**
	 * Hooks to the HTML page.
	 */
	var item_template = $("#item_template");
	var feed_container = $("#feed_content");

	/**
	 * Variables for polling the feed.
	 */
	var last_update = -1;
	var poll = 15;

	/**
	 * Method for rendering items from the feed.
	 */
	var addItems = function addItems(data)
	{
        	$.each(
			data.items,
			function(index, value)
			{
				item_template.
					tmpl(value).
					prependTo(feed_container).
					hide().
					delay((value.dt > 0 ? value.dt : 0)*1000).
					slideDown();
			}
		);
	};

	/**
	 * Method for deleting old items from the feed. This is required to prevent
	 * a memory leak.
	 */
	var deleteItems = function deleteItems()
	{
		feed_container.each(
			function(index)
			{
				if(index >= 10)
				{
					$(this).children().remove();
					$(this).remove();
				}
			}
		);
	}

	/**
	 * Method calls itself to retrieve the latest data from the live. Call this method to
	 * start the polling procedure.
	 */
	var runFeed = function runFeed()
	{
		$.getJSON(
			"http://api.searchbitcoin.com/services/economy?callback=?",
			{
				timestamp: last_update
			},
			function(data)
			{
				last_update = data.timestamp;
				addItems(data);
				deleteItems();
			}
		).complete(
			function()
			{
				setTimeout(runFeed, poll*1000);
			}
		);

	}

	/**
	 * Start the live feed.
	 */
	runFeed();
});


/**
 * Class handles search requests.
 */
$(function()
{
	/**
	 * Hooks to the HTML page.
	 */
	var item_template = $("#item_template");
	var result_container = $("#search_content");
	var form_container = $("#search_form");
	var query_container = $("input#search_text");
	var instructions = $("#search_instructions");
	var message_template = $("#message_template");
	var divider = $("#search_divider");

	/**
	 * Flag indicates if a query has been entered.
	 */
	var query_active = false;

	/**
	 * Method called to remove old search results and to display new ones.
	 */
	var displayResults = function displayResults(data)
	{
		divider.show();
		instructions.remove();
		result_container.children().remove()
		if($.isEmptyObject(data.items))
			message_template.
				tmpl([{message: "No matches found"}]).
				appendTo(result_container);
		else
		       	$.each(
				data.items,
				function(index, value)
				{
					item_template.
						tmpl(value).
						appendTo(result_container);
				}
			);
	};

	/**
	 * Handle search requests by submitting the query to the backend and then displaying the
	 * search results in the website.
	 */
	form_container.submit(
		function()
		{
			if(query_active)
				$.getJSON(
					"http://api.searchbitcoin.com/services/search?callback=?",
					{
						query: query_container.val(),
						exact: true,
						number: 11
					},
					function(data)
					{
						displayResults(data);
					}
				);
			else
				query_container.val("")
			return false;
		}
	);

	/**
	 * Clear the default message in the search box along, or if this has already happened then clear
	 * the old search results.
	 */
	query_container.click(
		function()
		{
			query_active = true;
			query_container.val("");
		}
	);

	/**
	 * Initial animation to display the instructions.
	 */
	instructions.
		delay(750).
		fadeIn(2000);
});


/**
 * Handles requests for all review information on an item of merchandise.
 */
function review(id)
{
	/**
	 * Hooks to the HTML page.
	 */
	var item_template = $("#review_item_template");
	var vendor_template = $("#review_vendor_template");
	var review_container = $("#review_content");
	var instructions = $("#review_instructions");

	/**
	 * Make request to fetch additional information about the item or vendor.
	 */
	$.getJSON(
		"http://api.searchbitcoin.com/services/review?callback=?",
		{
			id: id
		},
		function(data)
		{
			review_container.children().remove();
			if(!$.isEmptyObject(data.item))
				item_template.
					tmpl(data.item).
					appendTo(review_container);
			vendor_template.
				tmpl(data.vendor).
				appendTo(review_container);
		}
	);

	/**
	 * Remove instructions.
	 */
	instructions.remove();

	/**
	 * Reset the Disqus thread to the revelant conversations.
	 */
	DISQUS.reset(
		{
			reload: true,
			config: function()
			{
				this.page.identifier = "id_vendor="+id;
//				this.page.url = "http://example.com/#!newthread";
			}
		}
	);

	/**
	 * Show the disqus thread as the review is now loading or fully loaded.
	 */
	$("#disqus_thread").show();
}

$(function()
{
	/**
	 * Hooks to the HTML page.
	 */
	var instructions = $("#review_instructions");

	/**
	 * Initial animation to display the instructions.
	 */
	instructions.
		delay(2000).
		fadeIn(750);
});

/**
 * Submits votes to the database for processing.
 */
function vote(id, vote)
{
	/**
	 * Hooks to the HTML page.
	 */
	var message_container = $("#vote_message");

	/**
	 * Post the vote and display the response from the server.
	 */
	$.getJSON(
		"http://api.searchbitcoin.com/services/vote?callback=?",
		{
			id: id,
			vote: vote
		},
		function(data)
		{
			message_container.text(data.messages[0]);
		}
	);
}

