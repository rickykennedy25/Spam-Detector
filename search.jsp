<%@ page contentType="application/json" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javafx.util.Pair" %>
<%@ include file="search/KMP.jsp" %>
<%@ include file="search/BoyerMoore.jsp" %>
<%@ include file="tweet.jsp" %>

<%
	response.setContentType("application/json");
	response.setHeader("Content-Disposition", "inline");

    ArrayList<Tweet> tweets = importTweets();
    int count = 0;
%>

{
	"keyword": "<%= request.getParameter("keyword") %>",
	"count": 3,
	"result": [
		<%
		for (Tweet tweet : tweets) {
	    	ArrayList<Pair<Integer,Integer>> results;

			if (request.getParameter("algo").equals("regex")) {
				KMP kmp = new KMP(tweet.getText().toLowerCase(), request.getParameter("keyword").toLowerCase());
				results = kmp.getResult();
			} else if (request.getParameter("algo").equals("boyer")) {
				BoyerMoore boyerMoore = new BoyerMoore(tweet.getText().toLowerCase(), request.getParameter("keyword").toLowerCase());
				results = boyerMoore.getResult();
			} else /* request.getParameter("algo").equals("kmp") */ {
				KMP kmp = new KMP(tweet.getText().toLowerCase(), request.getParameter("keyword").toLowerCase());
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