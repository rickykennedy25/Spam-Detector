<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javafx.util.Pair" %>

<%!

public class BoyerMoore {
	private String text;
	private String pattern;

	public BoyerMoore(String text, String pattern) {
		this.text = text;
		this.pattern = pattern;
	}

	public ArrayList<Pair<Integer,Integer>> getResult() {
	    ArrayList<Pair<Integer,Integer>> res = new ArrayList<>();

	    int shift = 0;
	    while (shift + this.pattern.length() - 1 < this.text.length()) {
	    	int curIndex = this.pattern.length() - 1;
	    	while (curIndex >= 0 && this.pattern.charAt(curIndex) == this.text.charAt(shift + curIndex)) {
	    		curIndex--;
	    	}

	    	if (curIndex < 0) {
	    		res.add(new Pair(shift, shift + this.pattern.length() - 1));
	    		shift++;
	    	} else {
	    		int left = curIndex - 1;
	    		while (left >= 0 && this.pattern.charAt(left) != this.text.charAt(shift + curIndex)) {
	    			left--;
	    		}

	    		if (left >= 0) {
	    			shift = shift + curIndex - left;
	    		} else {
	    			int right = curIndex + 1;
	    			while (right < this.pattern.length() && this.pattern.charAt(right) != this.text.charAt(shift + curIndex)) {
		    			right++;
		    		}

		    		if (right < this.pattern.length()) {
		    			shift++;
		    		} else {
		    			shift = shift + curIndex + 1;
		    		}
	    		}
	    	}
	    }
	    return res;
	}
}

%>