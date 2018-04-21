<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javafx.util.Pair" %>

<%!

public class Regex {
	private String text;
	private String pattern;

	public Regex(String text, String pattern) {
		this.text = text;
		this.pattern = pattern;
	}

	public ArrayList<Pair<Integer,Integer>> getResult() {
	    ArrayList<Pair<Integer,Integer>> res = new ArrayList<>();

		Pattern pattern = Pattern.compile(this.pattern);
		Matcher matcher = pattern.matcher(this.text);

		while (matcher.find()) {
			res.add(new Pair(matcher.start(), matcher.end()-1));
		}

	    return res;
	}
}

%>