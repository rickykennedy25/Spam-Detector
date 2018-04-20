<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javafx.util.Pair" %>

<%!

public class KMP {
	private String text;
	private String pattern;

	public KMP(String text, String pattern) {
		this.text = text;
		this.pattern = pattern;
	}

	public int[] initBorder() {
	    int[] result = new int[this.pattern.length()];
	    
	    result[0] = 0;
	    int j = 0;
	    int i = 1;
	    for (i = 1; i<this.pattern.length(); i++) {
	        if (this.pattern.charAt(i) == this.pattern.charAt(j)) {
	            j++;
	            result[i] = j;
	        } else {
	            while ((j != 0) && (this.pattern.charAt(i) != this.pattern.charAt(j))) {
	                j = result[j-1];
	            }
	            if (this.pattern.charAt(i) == this.pattern.charAt(j)) {
	                j++;
	            }
	            result[i] = j;
	        }
	    }
	    return result;
	}

	public ArrayList<Pair<Integer,Integer>> getResult(){
	    ArrayList<Pair<Integer,Integer>> res = new ArrayList<>();
	    int[] border = new int[this.pattern.length()];
	    border = this.initBorder();
	    int i = 0;
	    int j = 0;
	    while (i < text.length()) {
	        if (this.text.charAt(i) == this.pattern.charAt(j)) {
	            if (j != this.pattern.length()-1) {
	                i++;
	                j++;
	            } else {
	                res.add(new Pair<>(i-j, i-j + this.pattern.length() - 1));
	                j=0;
	                i++;
	            }
	        } else {
	            if (j == 0) {
	                i++;
	            } else {
	                j = border[j];
	            }
	        }
	    }
	    return res;   
	}
}

public class Tweet {
	String profpic;
	String name;
	String text;
	String link;

	public Tweet(String text, String name, String profpic, String link) {
		this.profpic = profpic;
		this.name = name;
		this.text = text;
		this.link = link;
	}

	public String getText() { return this.text; }
	public String getProfpic() { return this.profpic; }
	public String getName() { return this.name; }
	public String getLink() { return this.link; }
}

public ArrayList<Tweet> importTweets() {
	ArrayList<Tweet> tweets = new ArrayList<>();

	tweets.add(new Tweet(
		"Ini tweet pendek (&lt;40 char).",
		"Orang 1",
		"//via.placeholder.com/100x100",
		"#"
	));

	tweets.add(new Tweet(
		"Ini tweet agak panjangan, tapi masih medium (&lt;80 char).",
		"Orang 2",
		"//via.placeholder.com/100x100",
		"#"
	));

	tweets.add(new Tweet(
		"Ini tweet paling panjang, ditampilinnya juga kecil. Tweet bisa sampe 2 baris, jadi tetep muat.",
		"Orang 1",
		"//via.placeholder.com/100x100",
		"#"
	));

	return tweets;
}

%>