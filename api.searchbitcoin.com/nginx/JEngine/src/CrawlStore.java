/**
 * Author: Jared L. Ostmeyer
 * Purpose: This is for adding merchandise (and removing expired merchandise) from an online store to the databae.
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-08-04
 */

// Include library for decoding HTML entities.
import edu.uci.ics.crawler4j.crawler.CrawlController;
// Include MySQL connector.
import java.sql.*;

/**
 * Script for crawling an online store and indexing the merchandise available at that store.
 */
public class CrawlStore {

	public static void main(String[] args) 	{
		try {
			// Load command line arguments.
			if(args.length < 2)
				throw new Exception("Missing one or both command line arguements.");
			String domain = args[0];
			double priority = Double.parseDouble(args[1]);
			// Connect to the database/
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/searchbitcoin", "searchbitcoin", "JAk22Sdn1L2pswSDqiKxla2");
//			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/searchbitcoin", "root", "");
			// Initialize database models.
			ParseStoreRules parseStoreRules = new ParseStoreRules();
			if(!parseStoreRules.loadStoreByDomain(connection, domain))
				throw new Exception("Failed to load row from \"ParseStoreRules\".");
			Items items = new Items(connection);
			// Setup the web-crawler. The parameter in the constructor specifies where temporary
			// data will be stored.
			CrawlController controller = new CrawlController("tmp/"+parseStoreRules.id_vendor);
			// Add the seed URLs to crawl.
			ResultSet resultSet = items.urlsByVendor(parseStoreRules.id_vendor);
			while(resultSet.next()) {
				String url = resultSet.getString("url");
				controller.addSeed(url);
			}
			controller.addSeed(parseStoreRules.crawl_seed);
			// Set the cutoff on the number of pages to download.
			controller.setMaximumPagesToFetch(parseStoreRules.crawl_page_limit);
			// Pass the database models to the web-crawler.
			StoreCrawler.initialize(items, parseStoreRules, priority);
			// Start the crawler, which will block until the crawl is finished.
			controller.start(StoreCrawler.class, 1);
			// Print some basic statistics about the merchandise supplied by the vendor.
			items.printStatsByVendor(parseStoreRules.id_vendor);
			// Close the DB connection.
			connection.close();
		}
		catch (Exception exception) {
			System.err.println("Exception: "+exception.getMessage());
			exception.printStackTrace();
			System.err.println();
		}
	}
}

