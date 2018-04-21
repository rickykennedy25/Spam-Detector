<%@ page contentType="application/json" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javafx.util.Pair" %>
<%@ include file="search/KMP.jsp" %>
<%@ include file="search/BoyerMoore.jsp" %>
<%@ include file="search/Regex.jsp" %>
<%@ include file="tweet.jsp" %>

<%
	response.setContentType("application/json");
	response.setHeader("Content-Disposition", "inline");

    ArrayList<Tweet> tweets = importTweets(request.getServletContext().getRealPath("/"));
    int count = 0;
%>

{
	"all": "<%= tweets.size() %>",
	"keyword": "<%= request.getParameter("keyword") %>",
	"result": [
		<%
		for (Tweet tweet : tweets) {
	    	ArrayList<Pair<Integer,Integer>> results;

	    	String text = tweet.getText().toLowerCase().replace("\\n", "\n").replace("\\\"", "\"");
			if (request.getParameter("algo").equals("regex")) {
				Regex regex = new Regex(text, request.getParameter("keyword").toLowerCase());
				results = regex.getResult();
			} else if (request.getParameter("algo").equals("boyer")) {
				BoyerMoore boyerMoore = new BoyerMoore(text, request.getParameter("keyword").toLowerCase());
				results = boyerMoore.getResult();
			} else /* request.getParameter("algo").equals("kmp") */ {
				KMP kmp = new KMP(text, request.getParameter("keyword").toLowerCase());
				results = kmp.getResult();
			}
	    	
	    	if (results.size() > 0) {
	    		if (count > 0) { out.println(","); }
	    		count++;
	    %>
	    	{
				"profpic": "<%= tweet.getProfpic() %>",
				"name": "<%= tweet.getName() %>",
				"tweet": "<%= tweet.getText() %>",
				"index": [
					<%
					int countt = 0;
					for (Pair<Integer,Integer> result : results) {
						if (countt > 0) { out.println(","); }
						countt++;
					%>
						{
							"start": <%= result.getKey() %>,
							"stop": <%= result.getValue() %>
						}
					<%
					}
					%>
				],
				"link": "<%= tweet.getLink() %>"
			}
	    <%
	    }
	}
	%>
	],
	"count": <%= count %>
}