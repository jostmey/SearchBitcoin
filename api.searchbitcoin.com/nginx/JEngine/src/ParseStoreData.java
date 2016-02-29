/**
 * Author: Jared L. Ostmeyer
 * Purpose: Holds the data parsed from a webpage on an online store.
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-07-31
 */

class ParseStoreData {

	public String url;
	public String title;
	public String description;
	public String image;
	public String price;
	public String category;

	public ParseStoreData() {
		this.url = null;
		this.title = null;
		this.description = null;
		this.image = null;
		this.price = null;
		this.category = null;
	}

	public ParseStoreData(
		String url,
		String title,
		String description,
		String image,
		String price,
		String category
	) {
		this.url = url;
		this.title = title;
		this.description = description;
		this.image = image;
		this.price = price;
		this.category = category;
	}
}
