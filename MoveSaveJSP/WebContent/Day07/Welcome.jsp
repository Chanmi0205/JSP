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
		
	<%=session.getAttribute("user_name")+"님 환영합니다"%>
	<button type="button" onClick="location.href='../Day08/LoginForm.jsp'">[로그인]</button> 
	
</body>
</html>