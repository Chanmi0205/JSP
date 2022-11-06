<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 값 확인</title>
</head>
<body>

	<%	
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		long creationTime = session.getCreationTime();
		String creationTimeStr = dateFormat.format(new Date(creationTime));
		
		long lastTime = session.getLastAccessedTime();
		String lastTimeStr = dateFormat.format(new Date(lastTime));
	%>
	
	<h2>
		<ul>
			<li>세션 유지 시간 : <%=session.getMaxInactiveInterval()%></li> 
			<li>세션 아이디 : <%= session.getId() %> </li>
			<li>형변환 전 데이터(최종 요청 시각 ) : <%= new Date(creationTime) %></li>
			<li>최종 요청 시각 (세션 생성 시각) : <%= creationTimeStr %></li>
			<li>형변환 전 데이터(마지막 요청 시각) : <%= lastTime %></li>
			<li>마지막 요청 시각 : <%= lastTimeStr %></li>
		</ul>
	</h2>
</body>
</html>
