<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.MemberDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 영역</title>
</head>
<body>

	<%
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		
		MemberDTO m1 = (MemberDTO)application.getAttribute("memberInfo");
		
		if(userId.equalsIgnoreCase(m1.getId()) && userPwd.equalsIgnoreCase(m1.getPass())) {
			request.setAttribute("userId", m1.getName());
			request.getRequestDispatcher("Welcome.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("Login.jsp?loginErr=1").forward(request, response);
		}
	
	%>	

</body>
</html>