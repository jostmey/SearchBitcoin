/**
 * Author: Jared L. Ostmeyer
 * Purpose: Wrapper for parsing HTML using CSS selector rules.
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-07-31
 */

// Include libraries for parsing webpages.
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
// Include library for manipularing URLs.
import java.net.URL;

/**
 * Wrapper that builds a method for parsing HTML using CSS selectors.
 */
class SelectorParser {

	/**
	 * Load the HTML from a string.
	 * var String html
	 */
	public void loadHtmlFromString(String html) throws Exception {
		this.document = Jsoup.parse(html);
	}

	/**
	 * Load the HTML from a URL.
	 * var String url
	 */
	public void loadHtmlFromUrl(String url) throws Exception {
		// this.document = Jsoup.connect(url).ignoreHttpErrors(true).get();
		this.document = Jsoup.connect(url).get();
	}

	/**
	 * Parse text from HTML using the selector and offset.
	 * var String selector
	 * var int offset
	 * return String (or null on failure)
	 */
	public String selectText(String selector, int offset) throws Exception {
		try {
			if(selector == null || selector.length() == 0)
				return null;
			Elements elements = this.document.select(selector);
			Element element = elements.get(offset);
			String text = element.text();
			return text;
		}
		catch(IndexOutOfBoundsException exception) {
			return null;
		}
	}

	/**
	 * Parse source from HTML tag using the selector and offset.
	 * var String selector
	 * var int offset
	 * return String (or null on failure)
	 */
	public String selectSrc(String selector, int offset) throws Exception {
		try {
			if(selector == null || selector.length() == 0)
				return null;
			Elements elements = this.document.select(selector);
			Element element = elements.get(offset);
			String url = element.attr("src");
			return url;
		}
		catch(IndexOutOfBoundsException exception) {
			return null;
		}
	}

	/**
	 * Object for storing the HTML document.
	 */
	private Document document;
}

