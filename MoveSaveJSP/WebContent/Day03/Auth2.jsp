<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="common.MemberDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 저장</title>
</head>
<body>

	<%
	
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		String userName = request.getParameter("name");
		
		MemberDTO m1 = new MemberDTO(userId, userPwd, userName);
		application.setAttribute("memberInfo", m1);
		
		response.sendRedirect("Login.jsp");
		
		System.out.println(userId + ", " + userPwd + ", " + userName);
		System.out.println(m1.toString());
		
	  %>

</body>
</html>