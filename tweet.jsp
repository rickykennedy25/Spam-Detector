<%@ page import="java.io.File" %>
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

    try {
      File file = new File("getData/hasil.txt");
      Scanner scanner = new Scanner(file);
      while (scanner.hasNextLine()) {
        String link = scanner.nextLine();
        String username = scanner.nextLine();
        String tweet = scanner.nextLine();
        String profpic = scanner.nextLine();

        tweets.add(new Tweet(
			tweet,
			username,
			profpic,
			link
		));
      }
    } catch (Exception e) {
      //
    }

	return tweets;
}

%>