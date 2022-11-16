<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.ReplyDTO" %>
<%@ page import="model1.board.ReplyDAO" %>   
<%@ page import="utils.JSFunction" %>
<%
	String r_content = request.getParameter("content");
	String sessionId = session.getAttribute("userId").toString();
	String num = request.getParameter("num");

	ReplyDAO rao = new ReplyDAO(application);
	
	ReplyDTO rto = new ReplyDTO();
	
	rto.setR_num(num);
	rto.setId(sessionId);
	rto.setr_Content(r_content);
	
	int result = rao.replyCreate(rto);

	if ( result == 1 && sessionId.equals(rto.getId())) {
		response.sendRedirect("List.jsp");	
	} else {
		JSFunction.alertBack("댓글 작성이 실패했습니다 :/", out);	
		response.sendRedirect("List.jsp");	
	}
	
	rao.close();
	
%>