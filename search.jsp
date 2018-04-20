<%@ page contentType="application/json" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javafx.util.Pair" %>
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
	    	KMP kmp = new KMP(tweet.getText().toLowerCase(), request.getParameter("keyword").toLowerCase());
	    	ArrayList<Pair<Integer,Integer>> results = kmp.getResult();
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