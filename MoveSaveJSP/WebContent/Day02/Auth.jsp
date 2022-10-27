<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크</title>
</head>
<body>

	<%
	
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	
	if(id.equalsIgnoreCase("chan") && pwd.equalsIgnoreCase("1234")) {
		response.sendRedirect("WelcomeTest.jsp?userId="+id);
	} else {
		request.getRequestDispatcher("LoginTest.jsp?loginErr=1").forward(request, response);
	}
	
	%>

</body>
</html>