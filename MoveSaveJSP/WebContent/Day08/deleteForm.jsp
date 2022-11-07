<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>

</head>
<body>
	
	
	<h2>회원 탈퇴 page</h2>
	
	<%= request.getAttribute("ErrMsg") == null ? " " : request.getAttribute("ErrMsg") %> 
	
	<form action="deleteProcess.jsp" method="post">
		탈퇴할 아이디 : <input type="text" name="user_id"> <br/>
		탈퇴할 패스워드 : <input type="password" name="user_pw"> <br/>
		<input type="submit" value="회원 탈퇴">
	</form>
</body>
</html>