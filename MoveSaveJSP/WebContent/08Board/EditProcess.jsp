<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDTO" %>    
<%@ page import="model1.board.BoardDAO" %>   

<%@ include file="./IsLoggedIn.jsp" %>
 
<%
    String title=request.getParameter("title");
	String content = request.getParameter("content");
	
	String num = request.getParameter("num");
	
	BoardDTO dto = new BoardDTO();
	
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	BoardDAO dao = new BoardDAO(application);
	int result = dao.updateEdit(dto);
	
	dao.close();
	
	if ( result == 1 ) {
		response.sendRedirect("View.jsp?num=" + dto.getNum());	
	} else {
		JSFunction.alertBack("수정하기에 실패했습니다 :/", out);	
	}
	
%>
