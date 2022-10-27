<!-- 메타 데이터 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ include file="Footer.jsp" %>

<!-- <%! %> : 변수나 메소드 등 정의 -->
<%!
	String str1 = "JSP";
	String str2 = "안녕하세요..";
	// void -> int
	public int add(int a, int b) {
		return a+b;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloJSP</title>
</head>
<body>
	<h2>처음 만들어보는 <%= str1 %></h2>
	<p>
		<!-- <% %> : 돌아갈 수 있는 코드 -->
		<%
			out.println(str2 + str1 +  "입니다. 열공합시다^^*");
		%>
	</p>
	
	<p> 
		<% 
			out.println(today);
			out.println(footerStr);
			out.println(add(3,4));
		%>
	</p>
	
	<p> <%=add(3,4)%> </p>
</body>
</html>