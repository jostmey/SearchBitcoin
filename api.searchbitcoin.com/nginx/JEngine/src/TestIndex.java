/**
 * Author: Jared L. Ostmeyer
 * Purpose: This is for testing parsing rules before trying them out in the live system.
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-07-31
 */

// Include MySQL connector.
import java.sql.*;

/**
 * Script for testing parsing rules in a property file before trying them out in the live system.
 */
public class TestIndex {

	/**
	 * Main method called when script is started.
	 */
	public static void main(String[] args) 	{
		try {
			// Load command line arguments.
			if(args.length < 2)
				throw new Exception("Missing one or both command line arguements.");
			String domain = args[0];
			String url = args[1];
			// Connect to the database/
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/searchbitcoin", "searchbitcoin", "JAk22Sdn1L2pswSDqiKxla2");
			// Load model for parsing data from a store.
			ParseStoreRules parseStoreRules = new ParseStoreRules();
			parseStoreRules.loadStoreByDomain(connection, domain);
			// Validate the URL and parse data from the URL.
			ParseStore parseStore = new ParseStore(parseStoreRules);
			if(!parseStore.crawlPage(url))
				throw new Exception("The URL provided does not conform to the crawl pattern.");
			if(!parseStore.indexPage(url))
				throw new Exception("The URL provided does not conform to the index pattern.");
			ParseStoreData parseStoreData = parseStore.parsePage(url);
			if(parseStoreData == null)
				throw new Exception("Failed to parse minumum required data from the page at the URL.");
			// Print the results.
			System.out.println();
			System.out.println("Title: "+parseStoreData.title);
			System.out.println();
			System.out.println("Description: "+parseStoreData.description);
			System.out.println();
			System.out.println("Image: "+parseStoreData.image);
			System.out.println();
			if(parseStoreData.category != null) {
				System.out.println("Category: "+parseStoreData.category);
				System.out.println();
			}
			if(parseStoreData.price != null) {
				System.out.println("Price: "+parseStoreData.price);
				System.out.println();
			}
			// Close the DB connection.
			connection.close();
		}
		catch(Exception exception) {
			System.err.println("Exception: "+exception.getMessage());
			exception.printStackTrace();
			System.err.println();
		}
	}
}

