/**
 * Author: Jared L. Ostmeyer
 * Purpose: Model for accessing the database table "Items". Note, each item saved to the database creates a relation with an
 * 	an entry in the database table "Vendors".
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-07-31
 */

// Include MySQL connector.
import java.sql.*;

/**
 * Model for saving newly indexed items of merchandise to the database.
 */
class Items {

	/**
	 * Constructor
	 * var Connection connection
	 */
	public Items(Connection connection) throws Exception {
		this.connection = connection;
	}

	/**
	 * Returns all the URLs associated with a particular vendor.
	 * var int id_vendor
	 * return ResultSet
	 */
	public ResultSet urlsByVendor(int id_vendor) throws Exception {
		Statement statement = this.connection.createStatement();
		String select = "SELECT url FROM Items "+
			"WHERE id_vendor = "+id_vendor+" AND ( status = 'active' OR status = 'expired')";
		ResultSet resultSet = statement.executeQuery(select);
		return resultSet;
	}

	/**
	 * Method for adding items parsed from a webpage of an online store.
	 * var ParseStoreData parseStoreData
	 * var int id_vendor
	 */
	public void addNew(ParseStoreData parseStoreData, int id_vendor, double priority) throws Exception {
		Statement statement = this.connection.createStatement();
		String select = "SELECT id, status FROM Items WHERE url = '"+parseStoreData.url+"'";
		ResultSet resultSet = statement.executeQuery(select);
		// Make sure the strings are not too long.
		if(parseStoreData.description.length() > 1024)
			parseStoreData.description = parseStoreData.description.substring(0, 1021)+"...";
		if(parseStoreData.title.length() > 256)
			parseStoreData.title = parseStoreData.title.substring(0, 256);
		if(parseStoreData.price != null && parseStoreData.price.length() > 32)
			parseStoreData.price = null;
		if(parseStoreData.category != null && parseStoreData.category.length() > 512)
			parseStoreData.category = null;
		// Check if the item is already in the database.
		if(resultSet.next()) {
			String status = resultSet.getString("status");
			// Check if the item is blocked for some reason.
			if(!status.equals("active") && !status.equals("expired"))
				return;
			// Update the item with the most recent information.
			String update = "UPDATE Items SET "+
				"id_vendor = ?, title = ?, description = ?, image = ?, "+
				"price = ?, tags = ?, status='active' "+
				"WHERE url = ?";
			PreparedStatement preparedStatement = this.connection.prepareStatement(update);
			preparedStatement.setInt(1, id_vendor);
			preparedStatement.setString(2, parseStoreData.title);
			preparedStatement.setString(3, parseStoreData.description);
			preparedStatement.setString(4, parseStoreData.image);
			preparedStatement.setString(5, parseStoreData.price);
			preparedStatement.setString(6, parseStoreData.category);
			preparedStatement.setString(7, parseStoreData.url);
			preparedStatement.execute();
		}
		else {
			// Insert new item.
			String insert = "INSERT INTO Items "+
				"( id_vendor, title, description, image, price, tags, url, priority, status, created ) "+
				"VALUES "+
				"( ?, ?, ?, ?, ?, ?, ?, ?, 'active', NOW() )";
			PreparedStatement preparedStatement = this.connection.prepareStatement(insert);
			preparedStatement.setInt(1, id_vendor);
			preparedStatement.setString(2, parseStoreData.title);
			preparedStatement.setString(3, parseStoreData.description);
			preparedStatement.setString(4, parseStoreData.image);
			preparedStatement.setString(5, parseStoreData.price);
			preparedStatement.setString(6, parseStoreData.category);
			preparedStatement.setString(7, parseStoreData.url);
			preparedStatement.setDouble(8, priority);
			preparedStatement.execute();
		}
	}

	/**
	 * Method for finding and recording duplicates. 
	 * var ParseStoreData parseStoreData
	 * var int id_vendor
	 */
	public void removeDuplicates(ParseStoreData parseStoreData, int id_vendor) throws Exception {
		// Variables.
		String query, update;
		PreparedStatement preparedStatement;
		Statement statement;
		ResultSet resultSet;
		String ids = "";
		int index;
		// Make sure the title is not too long.
		if(parseStoreData.title.length() > 256)
			parseStoreData.title = parseStoreData.title.substring(0, 256);
		// Find entries where the title is a repeat.
		query = "SELECT id FROM Items WHERE "+
			"( id_vendor, status, title ) = ( ?, 'active', ? ) "+
			"ORDER BY created ASC LIMIT 1, 5";
		preparedStatement = this.connection.prepareStatement(query);
		preparedStatement.setInt(1, id_vendor);
		preparedStatement.setString(2, parseStoreData.title);
		resultSet = preparedStatement.executeQuery();
		// Make the duplicate enteries as repeats.
		for(index = 0; resultSet.next(); index++) {
			ids = resultSet.getInt("id")+",";
		}
		if(index > 0) {
			ids = "("+ids.substring(0, ids.length()-1)+")";
			statement = this.connection.createStatement();
			update = "UPDATE Items SET status = 'repeat' WHERE id IN "+ids;
			statement.execute(update);
		}
		// Find entries where the image URL is a repeat.
		query = "SELECT id FROM Items WHERE "+
			"( id_vendor, status, image ) = ( ?, 'active', ? ) "+
			"ORDER BY created ASC LIMIT 1, 5";
		preparedStatement = this.connection.prepareStatement(query);
		preparedStatement.setInt(1, id_vendor);
		preparedStatement.setString(2, parseStoreData.image);
		resultSet = preparedStatement.executeQuery();
		// Make the duplicate enteries as repeats.
		for(index = 0; resultSet.next(); index++) {
			ids = resultSet.getInt("id")+",";
		}
		if(index > 0) {
			ids = "("+ids.substring(0, ids.length()-1)+")";
			statement = this.connection.createStatement();
			update = "UPDATE Items SET status = 'repeat' WHERE id IN "+ids;
			statement.execute(update);
		}
	}

	/**
	 * Method for marking an item in the database as expired.
	 * var String url
	 */
	public void expireByUrl(String url) throws Exception {
		String update = "UPDATE Items SET status = 'expired' WHERE url = ?";
		PreparedStatement preparedStatement = this.connection.prepareStatement(update);
		preparedStatement.setString(1, url);
		preparedStatement.execute();
	}

	/**
	 * Prints some basic statistics about the merchanise of the given vendor to STDOUT.
	 * var int id_vendor
	 */
	public void printStatsByVendor(int id_vendor) throws Exception {
		String select = "SELECT SUM(priority), COUNT(*) FROM Items WHERE id_vendor = ? AND status='active'";
		PreparedStatement preparedStatement = this.connection.prepareStatement(select);
		preparedStatement.setInt(1, id_vendor);
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) {
			System.out.println("Total Priority: "+resultSet.getString(1));
			System.out.println("Number Active: "+resultSet.getString(2));
		}
		select = "SELECT COUNT(*) FROM Items WHERE id_vendor = ? AND status='expired'";
		preparedStatement = this.connection.prepareStatement(select);
		preparedStatement.setInt(1, id_vendor);
		resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) {
			System.out.println("Number Expired: "+resultSet.getString(1));
		}
	}

	private Connection connection;
}
