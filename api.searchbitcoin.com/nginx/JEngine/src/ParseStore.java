/**
 * Author: Jared L. Ostmeyer
 * Purpose: Parses data about a piece of merchandise from a webpage in an online webstore.
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-08-01
 */

// Include class for handling regular expressions.
import java.util.regex.*;

/**
 * Class used to parse a webpage from an online store to collect data about the merchandise in the store.
 */
class ParseStore {

	/**
	 * Constructor
	 * var ParseStoreRules parseStoreRules
	 */
	public ParseStore(ParseStoreRules parseStoreRules) throws Exception {
		this.parseStoreRules = parseStoreRules;
		this.crawl_pattern = Pattern.compile(parseStoreRules.crawl_pattern, Pattern.CASE_INSENSITIVE);
		this.index_pattern = Pattern.compile(parseStoreRules.index_pattern, Pattern.CASE_INSENSITIVE);
		this.expiration_pattern = Pattern.compile(parseStoreRules.expiration_pattern, Pattern.CASE_INSENSITIVE);
		this.selectorParser = new SelectorParser();
	}

	/**
	 * Method indicates if a page can and should be indexed.
	 * var String url
	 * var return boolean
	 */
	public boolean crawlPage(String url) throws Exception {
		if(this.crawl_pattern.matcher(url).matches())
			return true;
		return false;
	}

	/**
	 * Method indicates if a page can and should be indexed.
	 * var String url
	 * var return boolean
	 */
	public boolean indexPage(String url) throws Exception {
		if(this.index_pattern.matcher(url).matches())
			return true;
		return false;
	}

	/**
	 * Method parses data from webpage belonging to the online store at the specified url.
	 * var String url.
	 * return ParseStoreData
	 */
	public ParseStoreData parsePage(String url) throws Exception {
		this.selectorParser.loadHtmlFromUrl(url);
		return parseLoadedPage(url);
	}

	public ParseStoreData parsePage(String url, String html) throws Exception {
		this.selectorParser.loadHtmlFromString(html);
		return parseLoadedPage(url);
	}

	private ParseStoreRules parseStoreRules;
	private Pattern crawl_pattern;
	private Pattern index_pattern;
	private Pattern expiration_pattern;
	private SelectorParser selectorParser;

	/**
	 * Method parses data from webpage. It required that the "SelectorParser" object be initialized and
	 * contain the HTML dom.
	 */
	private ParseStoreData parseLoadedPage(String url) throws Exception {
		ParseStoreData parseStoreData = new ParseStoreData();
		parseStoreData.url = url;
		// Parse data from the webpage.
		parseStoreData.title = this.selectorParser.selectText(
			this.parseStoreRules.title_selector,
			this.parseStoreRules.title_offset
		);
		parseStoreData.description = this.selectorParser.selectText(
			this.parseStoreRules.description_selector,
			this.parseStoreRules.description_offset
		);
		parseStoreData.image = this.selectorParser.selectSrc(
			this.parseStoreRules.image_selector,
			this.parseStoreRules.image_offset
		);
		parseStoreData.price = this.selectorParser.selectText(
			this.parseStoreRules.price_selector,
			this.parseStoreRules.price_offset
		);
		parseStoreData.category = this.selectorParser.selectText(
			this.parseStoreRules.category_selector,
			this.parseStoreRules.category_offset
		);
		// Check that all the required data was successfully parsed.
		if(parseStoreData.title == null || parseStoreData.description == null || parseStoreData.image == null)
			return null;
		// Check if their is an expiration rule, and if so, if the webpage is expired.
		String expiration = this.selectorParser.selectText(
			this.parseStoreRules.expiration_selector,
			this.parseStoreRules.expiration_offset
		);
		if(expiration != null) {
			if(this.expiration_pattern.matcher(expiration).matches())
				return null;
		}
		// The URL to the image could be a partial or incomplete URL.
		parseStoreData.image = UrlCleaner.absUrl(url, parseStoreData.image);
		// Return the results.
		return parseStoreData;
	}
}
