<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
       
	<h2>Welcome</h2>
		
	<%
	String id = request.getParameter("usedId");
	out.println(id+"님 환경합니다."); %> 
	
	<br/> <br/>
	
	<button> <a href="LoginTest.jsp">로그아웃</a> </button>
	
</body>
</html>