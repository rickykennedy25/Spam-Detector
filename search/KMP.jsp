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

%>