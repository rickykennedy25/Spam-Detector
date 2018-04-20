<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javafx.util.Pair" %>

<%!

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