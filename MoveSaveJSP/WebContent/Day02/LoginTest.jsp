<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginTest</title>
</head>
<body>
	 
	<h2>로그인</h2>
	
	<%
		String loginErr = request.getParameter("loginErr");
		if(loginErr != null) {
			out.println("로그인에 실패하였습니다.");
		}
	%>
	
	<form method="post" action="Auth.jsp">
		<label> <strong> 아이디 </strong><br/> <input type="text" name="user_id" placeholder="아이디를 입력하세요..." /> </label> <br/> <br/>
		<label> <strong> 비밀번호 </strong><br/>  <input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요..." /> </label> <br/> <br/>
		<input type="submit" value="로그인"/>
	</form>
	
	
</body>
</html>