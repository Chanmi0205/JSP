<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String user_id = request.getParameter("user_id");
    	String user_pw = request.getParameter("user_pw");
    	String user_name = request.getParameter("user_name");

    	session.setAttribute("UserId", user_id);
		session.setAttribute("UserName", user_name);
		
    	response.sendRedirect("RegisterForm.jsp");
	%>