<script id="item_template" type="text/x-jquery-tmpl">
	<div class="item_content" onmouseover="$('#item_menu_'+${id}).show();" onmouseout="$('#item_menu_'+${id}).hide();">
		<div class="item_image_container">
			<img class="item_image" src="http://api.searchbitcoin.com/services/image/${id}" />
		</div>
		<div class="item_text_container">
			<div class="item_title">${title}</div>
			<div class="item_domain">${domain}</div>
		</div>
		<div id="item_menu_${id}" class="item_menu">
			<span class="min-button item_menu_buy" onclick="window.open('${url}');">Visit Store</span>
			<span class="item_menu_review min-button" onclick="review(${id});">Seller Reviews</span>
		</div>
	</div>
	<hr/>
</script>

<script id="message_template" type="text/x-jquery-tmpl">
	<div id="search_message">${message}</div>
</script>

<script id="search_more_template" type="text/x-jquery-tmpl">
	<div class="min-button" id="search_more">Show More Results</div>
</script>

<script id="review_vendor_template" type="text/x-jquery-tmpl">
	<div id="review_comment"></div>
</script>

