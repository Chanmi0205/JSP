<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 만든 Cookie~</title>
</head>
<body>
	
	<h2>쿠기 굽기</h2>
	<%
		Cookie c = new Cookie("myName", "내가만든쿠키");
	
		// request.getContextPath() : 현대 나의 프로젝트의 명 return
		c.setPath(request.getContextPath());
		
		//유효 기간 : 1시간 60초(1분)*60
		c.setMaxAge(60*60);
		
		response.addCookie(c); // 중요
	%>
	
	<h2>쿠키 체크하기</h2>
	<%
		Cookie[] cookies = request.getCookies();
		if ( cookies != null ) { 
			for(int i=0; i<cookies.length; i++) {
				out.println(cookies[i].getName());
				out.println(cookies[i].getValue());
			}
			
			/*
				for(Cookie cookie : cookies) {
					cookie.getName();
				}
			*/
		}
	%>
	
	<a href="Main.jsp">이동하기 ㅎㅅㅎ</a>
	
</body>
</html>