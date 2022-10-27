<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>

	<h2>회원가입</h2>
	
	<form method="post" action="Auth2.jsp"> 
		<label> ID <input type="text" name="id" placeholder="ID를 입력하세요" required/> </label> <br/>
		<label> Password <input type="password" name="pwd" placeholder="비밀번호를 입력하세요" required/> </label> <br/>
		<label> Name <input type="text" name="name" placeholder="영어 이름를 입력하세요" required/> </label> <br/>
		<input type="submit" value="회원가입"/>
	</form>
	
</body>
</html>