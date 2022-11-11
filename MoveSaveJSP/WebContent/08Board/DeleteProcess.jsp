<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDTO" %>    
<%@ page import="model1.board.BoardDAO" %>   

<%@ include file="./IsLoggedIn.jsp" %>

<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	int result = dao.deletePost(num);
	dao.close();

	if ( result == 1 ) {
		response.sendRedirect("List.jsp");	
	} else {
		JSFunction.alertBack("수정하기에 실패했습니다 :/", out);	
		response.sendRedirect("List.jsp");	
	}
%>