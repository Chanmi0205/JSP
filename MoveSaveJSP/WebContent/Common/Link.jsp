<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//상단에 클릭하면 이동하는 메뉴 만들기(include)
	// 로그인or로그아웃 게시판(무한 스크롤) 게시판(페이지)
%>

<table>

	<tr>
		<td align="center">
	
			<% if(session.getAttribute("userId") == null) { %>
		
			<button type="button" onClick="location.href='../Day08/LoginForm.jsp'">[로그인]</button>
			
			<% } else { %>
			
			<button type="button" onClick="location.href='../Day08/Logout.jsp'">[로그아웃]</button>
						
			<% } %> 
			
			&nbsp;	&nbsp;	&nbsp;
			
			<button type="button" onClick="location.href='../08Board/List.jsp'">게시판(페이징x)</button>

			&nbsp;	&nbsp;	&nbsp;

			<button type="button" onClick="location.href='../09PagingBoard/List.jsp'">게시판(페이징o)</button>
			
		</td>
	</tr>

</table>