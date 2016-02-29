/**
 * Author: Jared L. Ostmeyer
 * Purpose: Web-crawler finds pages in website to index.
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-08-03
 */

// Include classes for crawling the web.
import edu.uci.ics.crawler4j.crawler.Page;
import edu.uci.ics.crawler4j.crawler.WebCrawler;
import edu.uci.ics.crawler4j.url.WebURL;

/**
 * Extension of web-crawler class defines methods for determining which URLs to crawl and which webpages to index.
 */
public class StoreCrawler extends WebCrawler {

	/**
	 * Call to the initialize the crawler. Call before staring the crawler.
	 * var Items items
	 * var ParseStoreRules parseStoreRules
	 */
	public static void initialize(Items items_, ParseStoreRules parseStoreRules_, double priority_) {
		try {
			items = items_;
			parseStoreRules = parseStoreRules_;
			parseStore = new ParseStore(parseStoreRules);
			priority = priority_;
			found = 0;
			downloaded = 0;
			indexed = 0;
		}
		catch(Exception exception) {
			System.err.println("Exception: "+exception.getMessage());
			exception.printStackTrace();
			System.err.println();
		}
	}

	/**
	 * Method called to determine if the link should be opened and the webpage downloaded.
	 * var WebURL webURL
	 */
	public boolean shouldVisit(WebURL webURL) {
		try {
			// The IF statement is a hack to catch an error in the web-crawler.
			if(webURL.getURL() == null)
				return false;
		        String href = webURL.getURL().toLowerCase();
			if(this.parseStore.crawlPage(href) || this.parseStore.indexPage(href))
		                return true;
//			else
//				System.out.println("Found: "+href);
			this.found++;
			if(this.found % 1000 == 0)
				System.out.println("Number Links Found: "+this.found);
		}
		catch(Exception exception) {
			System.err.println("Url: "+webURL.getURL().toLowerCase());
			System.err.println("Exception: "+exception.getMessage());
			exception.printStackTrace();
			System.err.println();
		}
	        return false;
	}

	/**
	 * Called to index page after it has been downloaded.
	 * var Page page
	 */	
	public void visit(Page page) {
		try {
			String url = page.getWebURL().getURL();
			if(this.parseStore.indexPage(url)) {
				String html = page.getHTML();
				ParseStoreData parseStoreData = this.parseStore.parsePage(url, html);
				if(parseStoreData != null) {
					this.items.addNew(parseStoreData, this.parseStoreRules.id_vendor, this.priority);
					this.items.removeDuplicates(parseStoreData, this.parseStoreRules.id_vendor);
					System.out.println("Indexed: "+url);
				}
				else {
					this.items.expireByUrl(url);
					System.out.println("Expired: "+url);
				}
				this.indexed++;
				if(this.indexed % 10 == 0)
					System.out.println("Number Pages Indexed: "+this.indexed);
			}
//			else
//				System.out.println("Downloaded: "+url);
			this.downloaded++;
			if(this.downloaded % 100 == 0)
				System.out.println("Number Pages Downloaded: "+this.downloaded);
		}
		catch(Exception exception) {
			System.err.println("Url: "+page.getWebURL().getURL());
			System.err.println("Exception: "+exception.getMessage());
			exception.printStackTrace();
			System.err.println();
		}
	}

	private static Items items;
	private static ParseStoreRules parseStoreRules;
	private static ParseStore parseStore;
	private static double priority;
	private static int found;
	private static int downloaded;
	private static int indexed;
}

