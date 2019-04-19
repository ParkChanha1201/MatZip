package crawling;

import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
 
public class test {
 
    /*
     *  Document 클래스 : 연결해서 얻어온 HTML 전체 문서
     *  Element 클래스  : Documnet의 HTML 요소
     *  Elements 클래스 : Element가 모인 자료형
     */
     
    public static void main(String[] args) {
     
        String url = "https://www.google.com/search?q=%EC%97%AD%EC%A0%84%EC%9A%B0%EB%8F%99";
        
        try {
			Document doc = Jsoup.connect(url).get();
			Elements el = doc.select("img");
			//Elements el2 = el.select("data-img-url");
			
			
			for(Element e : el) {
				System.out.println(e.attr("data-img-url"));
			}
			
			
			
			//System.out.println(doc.toString());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
    }
 
}
