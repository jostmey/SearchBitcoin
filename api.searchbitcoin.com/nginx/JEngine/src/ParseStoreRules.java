/**
 * Author: Jared L. Ostmeyer
 * Purpose: Model for reading the database table "ParseStoreRules"
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-07-31
 */

// Include MySQL connector.
import java.sql.*;

/**
 * Model loads row as member variables. This model is read-only.
 */
class ParseStoreRules {

	/**
	 * Columns in "ParsingStoreRules".
	 */
	public int id;
	public int id_vendor;
	public String crawl_seed;
	public String crawl_pattern;
	public int crawl_frequency;
	public int crawl_page_limit;
	public String index_pattern;
	public String title_selector;
	public int title_offset;
	public String description_selector;
	public int description_offset;
	public String image_selector;
	public int image_offset;
	public String price_selector;
	public int price_offset;
	public String category_selector;
	public int category_offset;
	public String expiration_selector;
	public int expiration_offset;
	public String expiration_pattern;
	public String status;
	public String created;

	/**
	 * Method loads row by primary key.
	 * var Connection connection
	 * var int pk
	 * return boolean
	 */
	public boolean loadStoreByPk(Connection connection, int pk) throws Exception {
		Statement statement = connection.createStatement();
		String query = "SELECT * FROM ParseStoreRules WHERE id="+pk;
		ResultSet resultSet = statement.executeQuery(query);
		if(!resultSet.next())
			return false;
		this.loadRow(resultSet);
		return true;
	}

	/**
	 * Method first website with a URL matching the domain.
	 * var Connection connection
	 * var String domain
	 * return boolean
	 */
	public boolean loadStoreByDomain(Connection connection, String domain) throws Exception {
		Statement statement = connection.createStatement();
		String query = "SELECT * FROM ParseStoreRules WHERE crawl_seed LIKE '%"+domain+"%'";
		ResultSet resultSet = statement.executeQuery(query);
		if(!resultSet.next())
			return false;
		this.loadRow(resultSet);
		return true;
	}

	private Connection connection;

	private void loadRow(ResultSet resultSet) throws Exception {
		this.id = resultSet.getInt("id");
		this.id_vendor = resultSet.getInt("id_vendor");
		this.crawl_seed = resultSet.getString("crawl_seed");
		this.crawl_pattern = resultSet.getString("crawl_pattern");
		this.crawl_frequency = resultSet.getInt("crawl_frequency");
		this.crawl_page_limit = resultSet.getInt("crawl_page_limit");
		this.index_pattern = resultSet.getString("index_pattern");
		this.title_selector = resultSet.getString("title_selector");
		this.title_offset = resultSet.getInt("title_offset");
		this.description_selector = resultSet.getString("description_selector");
		this.description_offset = resultSet.getInt("description_offset");
		this.image_selector = resultSet.getString("image_selector");
		this.image_offset = resultSet.getInt("image_offset");
		this.price_selector = resultSet.getString("price_selector");
		this.price_offset = resultSet.getInt("price_offset");
		this.category_selector = resultSet.getString("category_selector");
		this.category_offset = resultSet.getInt("category_offset");
		this.expiration_selector = resultSet.getString("expiration_selector");
		this.expiration_offset = resultSet.getInt("expiration_offset");
		this.expiration_pattern = resultSet.getString("expiration_pattern");
		this.status = resultSet.getString("status");
		this.created = resultSet.getString("created");
	}
}
