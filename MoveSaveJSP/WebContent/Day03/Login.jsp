<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>


	<h2>로그인</h2>
	
	<%

		String loginErr = request.getParameter("loginErr");
		if(loginErr != null) {
			out.println("로그인에 실패하였습니다.");
		}
		
	%>
	
	<form method="post" action="Auth3.jsp">
		<label> 아이디 <input type="text" name="id"/> </label> <br/>
		<label> 비밀번호 <input type="password" name="pwd"/> </label> <br/>
		<input type="submit" value="로그인"/>
	</form>
	
</body>
</html>