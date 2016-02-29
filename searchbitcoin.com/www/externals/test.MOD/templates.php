<script id="item_template" type="text/x-jquery-tmpl">
	<div class="item_content" onmouseover="review(${id});" onclick="window.open('${url}');">
		<div class="item_image_container">
			<img class="item_image" src="http://api.searchbitcoin.com/services/image/${id}" />
		</div>
		<div class="item_text_container">
			<div class="item_title">${title}</div>
			<div class="item_domain">${domain}</div>
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

<script id="review_item_template" type="text/x-jquery-tmpl">
	<div id="review_merchandise">
		<h3>Merchandise</h3>
		<div class="review_row">
			<div id="review_item">
				<img id="review_item_image" onclick="window.open('${url}');" src="http://api.searchbitcoin.com/services/image/${id}/large" />
				<div class="min-button" id="review_item_buy" onclick="window.open('${url}');">Buy<br/>@ Store</div>
			</div>
		</div>
		<div class="review_row">
			<span class="review_label">Title:&nbsp;</span>
			<div class="review_data">${title}</div>
		</div>
		{{if price}}<div class="review_row">
			<span class="review_label">Forecasted Price:&nbsp;</span>
			<div class="review_data">${price}</div>
		</div>{{/if}}
	</div>
	<hr/>
</script>

<script id="review_vendor_template" type="text/x-jquery-tmpl">
	<div id="review_vendor">
		<h3>Store</h3>
		<div class="review_row">
			<span class="review_label">Title:&nbsp;</span>
			<div class="review_data">${title}</div>
		</div>
		<div class="review_row">
			<span class="review_label">Website:&nbsp;</span>
			<div class="review_data"><a href="${url}" target="_blank">${domain}</a></div>
		</div>
		<div class="review_row">
			<span class="review_label">Logo:&nbsp;</span>
			<div class="review_data">
				<a href="${url}" target="_blank">
					<img src="http://api.searchbitcoin.com/services/image/${id}" />
				</a>
			</div>
		</div>
		<div class="review_row">
			<span class="review_label">Description:&nbsp;</span>
			<div class="review_data">${description}</div>
		</div>
		{{if country}}<div class="review_row">
			<span class="review_label">Country:&nbsp;</span>
			<div class="review_data">${country}</div>
		</div>{{/if}}
		{{if province}}<div class="review_row">
			<span class="review_label">Province/State:&nbsp;</span>
			<div class="review_data">${province}</div>
		</div>{{/if}}
		{{if city}}<div class="review_row">
			<span class="review_label">City:&nbsp;</span>
			<div class="review_data">${city}</div>
		</div>{{/if}}
		{{if payment_instructions}}<div class="review_row">
			<span class="review_label">Payment Instructions:&nbsp;</span>
			<div class="review_data">${payment_instructions}</div>
		</div>{{/if}}
	</div>
	<!-- <hr/> -->
</script>
