<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>

	<h2>Welcome</h2>
	
	<%	
		out.println(request.getParameter("userId")+"님 환영합니다."); %>
	   
</body>
</html>