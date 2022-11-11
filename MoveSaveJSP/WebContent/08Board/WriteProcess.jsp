<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ include file="./IsLoggedIn.jsp" %>

	<% 
	
		BoardDAO dao = new BoardDAO(application);
		BoardDTO dto = new BoardDTO();
		
		String id = session.getAttribute("userId").toString();
      	String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        dto.setId(id);
        dto.setTitle(title);
        dto.setContent(content);
        
	    int result = dao.inserWrite(dto);
	    
	    
	    dao.close();
        
		// 유저가 입력한 title, content 값을 받아와서
		// boardDB에 넣을 수 있도록 BoardDTO 객체 생성하여 전달!
		
		if ( result == 1 ) {
			response.sendRedirect("List.jsp");
		} else {
			JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
		}
		
	%>
	