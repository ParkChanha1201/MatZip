package crawling;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import db.DBManager;

public class Crawl {

	private static Crawl crawling = null;

	private Crawl() {

	}

	public synchronized static Crawl getInstance() {
		if (crawling == null) {
			crawling = new Crawl();
		}
		return crawling;
	}

	public ArrayList<String> searchImage(String rest_name) {

			String url = "https://www.google.com/search?q=" + rest_name;
	        ArrayList<String> imgs = new ArrayList<String>();
			
	        try {
				Document doc = Jsoup.connect(url).get();
				Elements el = doc.select("img");
				//Elements el2 = el.select("data-img-url");
				
				
				for(Element e : el) {
					imgs.add(e.attr("data-img-url"));
				}
	
				return imgs;
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        return imgs;    
	}
}
