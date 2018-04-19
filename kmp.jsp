<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<title>KMP Algorithm</title>
</head>
<%! 
    public int[] initBorder(String input){
        int[] result = new int[input.length()];
        
        result[0] = 0;
        int j = 0;
        int i = 1;
        for (i = 1; i<input.length(); i++){
            if (input.charAt(i) == input.charAt(j)){
                j++;
                result[i] = j;
            }
            else{
                while((j != 0) && (input.charAt(i) != input.charAt(j))){
                    j = result[j-1];
                }
                if(input.charAt(i) == input.charAt(j)){
                    j++;
                }
                result[i] = j;
            }
        }
        return result;
    }

    public ArrayList<Integer> KMP(String text, String pattern){
        ArrayList<Integer> res = new ArrayList<>();
        int[] border = new int[pattern.length()];
        border = initBorder(pattern);
        int i = 0;
        int j = 0;
        while(i < text.length()){
            if(text.charAt(i) == pattern.charAt(j)){
                if (j != pattern.length()-1){
                    i++;
                    j++;
                }
                else{
                    res.add(i-j);
                    j=0;
                    i++;
                }
            }
            else{
                if (j == 0){
                    i++;
                }
                else{
                    j = border[j];
                }
            }
        }
        return res;   
    }
%>
<body>
<h1>dalam string "abacaabacaabcaaabaca" terdapat "abaca" pada index: </h1>
<% 
    ArrayList<Integer> result = new ArrayList<>();
    result = KMP("abacaabacaabcaaabaca", "abaca");
    for (int i=0; i < result.size(); i++){
        out.println(result.get(i));
    }
%>
</body>
</html>