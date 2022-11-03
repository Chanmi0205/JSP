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
	<!-- test3 -->
	<%
		String name = request.getParameter("name");
		out.println(name+"님 환경합니다."); 
	%> 

	
</body>
</html>