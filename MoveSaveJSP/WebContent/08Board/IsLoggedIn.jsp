<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="utils.JSFunction" %>

<%
		if ( session.getAttribute("userId") == null ) {
		// 로그인 후 접근 가능합니다. 로그인창으로 이동!
		
		JSFunction.alertLocation("로그인 후 글 작성이 가능합니다.", "../Day08/LoginForm.jsp", out);
	 	
		return;  
	} 
%>