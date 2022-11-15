<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDTO" %>    
<%@ page import="model1.board.BoardDAO" %>   

<%@ include file="./IsLoggedIn.jsp" %>

<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = dao.selectView(num);
	
	String sessionId = session.getAttribute("userId").toString();
	int result = dao.deletePost(num);
	dao.close();

	// 삭제하는 사람 -> session.UserId에 저장된, 현재 로그인한 유저
	
	if ( result == 1 && sessionId.equals(dto.getId())) {
		response.sendRedirect("List.jsp");	
	} else {
		JSFunction.alertBack("수정하기에 실패했습니다 :/", out);	
		response.sendRedirect("List.jsp");	
	}
	

%>