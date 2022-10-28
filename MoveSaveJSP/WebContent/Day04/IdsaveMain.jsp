<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="utils.CookieManger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie를 사용하여 아이디 저장하는 로그인 화면</title>
</head>
<body>

	<%
		String loginIdCookieVal = "";
	
		Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for(int i=0; i<cookies.length; i++) {
					
					String cookieName = cookies[i].getName();
					
					if ( cookieName.equals("loginId") ) {
						loginIdCookieVal = cookies[i].getValue();
					}
				}
			}
			// 위 코드와 아래 코드는 동일 코드
			// String loginId = CookieManger.readCookie(request, "loginId");
			
			String cookieCheck = "";
			if ( !loginIdCookieVal.equals("")) {
				cookieCheck = "checked";	
			}
	%> 

 	<h2>로그인 페이지</h2>
 	<form method="post" action="IdSaveProcess.jsp">
 		<label> 아이디 :  <input type="text" name="user_id" value="<%= loginIdCookieVal %>"/> </label> 
 	 	<label> <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %>> 아이디 저장하기 </label> <br/>
 		<label> 비밀번호 : <input type="password" name="user_pw"/> </label> <br/>
 		<input type="submit" value="로그인"/>
 	</form>

</body>
</html>