/**
 * Author: Jared L. Ostmeyer
 * Purpose: For ensuring that the URLs are always absolute URLs.
 * Email Address: jostmey@gmail.com
 * Date Started: 2011-07-31
 */

// Include library for manipularing URLs.
import java.net.URL;

/**
 * Class contains static method for cleaning up URLs.
 */
class UrlCleaner {

	/**
	 * Converts URL to an full URL if it is not already one.
	 * var String urlCurrent (needed to complete relative or partial URLs)
	 * var String urlRaw
	 * return String
	 */
	public static String absUrl(String urlCurrent, String urlRaw) throws Exception {
		URL baseUrl = new URL(urlCurrent);
		URL url = new URL(baseUrl, urlRaw);
		return url.toString();
	}
}

