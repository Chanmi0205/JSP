<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>

<%
	String num = request.getParameter("num");

	BoardDAO dao = new BoardDAO(application);
	dao.updateVisitCount(num);
	BoardDTO dto = dao.selectView(num);
	
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>

	<!--  
		  [번호]  [dto.getNum()] 			[작성자] [dto.getName()]
		  [작성일] [dto.getPostdate()]	[조회수] [dto.getVisitcount()]
		  [제목]	 [dto.getTitle()]
		  [내용]	 [dto.getContent()]
		  
		  [수정하기][삭제하기][목록보기]	 
	 -->
	
	<jsp:include page="../Common/Link.jsp"/>
	<h2>상세 보기(View)</h2>
	
	<table border="1" style="width:100%">
		
		<tr>
			<td>번호</td>
			<td><%=dto.getNum() %></td>
			<td>작성자</td>
			<td><%=dto.getName() %></td>
		</tr>
		
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostdate() %></td>
			<td>조회수</td>
			<td><%=dto.getVisitcount() %></td>
		</tr>
		
		<tr>
			<td>제목</td>
			<td colspan="3"><%=dto.getTitle() %></td>
		</tr>
		
		<tr>
			<td>내용</td>
			 <td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br/>") %></td>
		</tr>
		
		<tr>
			<td colspan="4" align="center">
				
				<% 
				if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())) { 
				%>
				
					<button type="button">[수정하기]</button>
					<button type="button">[삭제하기]</button>
				
				<% } %>
				
					<button type="button" onclick="location.href='List.jsp';">[목록 보기]</button> 
			</td>
		</tr>
	
	</table>
	
</body>
</html>