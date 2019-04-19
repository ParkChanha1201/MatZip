<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="crawling.Crawl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Crawl crawl = Crawl.getInstance();

	ArrayList<String> a = crawl.searchImage("역전우동");

	for(int i = 0;i < a.size();i++){
		
		if(!a.get(i).equals("")){
			out.println("<img src=\""+a.get(i)+"\""+ "width = \"100px\" height = \"100px\">");
		}	
	}
	
%>

</body>
</html>