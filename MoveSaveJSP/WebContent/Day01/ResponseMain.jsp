<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 예제</title>
</head>
<body>
	<h2>1. 로그인 폼</h2> 
	
	<form method="post" action="ResponseLogin.jsp">
		<label>id <input type="text" name="user_id"/> </label> <br/>
		<label>password <input type="password" name="user_pwd"/> </label> <br/>
		<input type="submit" value="로그인"/>
	</form>
	
	<br/>
	
	<%
		String loginErr = request.getParameter("loginErr");
		if(loginErr != null) {
			out.println("로그인에 실패하였습니다.");
		}
	%> 
	
</body>
</html>