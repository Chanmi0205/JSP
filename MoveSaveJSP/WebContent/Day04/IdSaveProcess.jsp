<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="utils.JSFunction" %>
<%@ page import="utils.CookieManger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인&아이디 저장(쿠키)</title>
</head>
<body>
	
	<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");
			
		if ("must".equals(user_id) && "1234".equals(user_pw)) {
		// 유저가 '아이디 저장하기'를 체크한 경우
		if ( save_check != null && save_check.equals("Y") ) {
			
			/* 
			Cookie c = new Cookie("loginId", user_id);
			c.setPath("/");
			
			// 8640 -> 하루(24시간)
			c.setMaxAge(8640);
			response.addCookie(c); 

			아래코드와 위 코드는 같은 코드 */
			
			CookieManger.makeCookie(response, "loginId", user_id, 86400);
		} else {
	 		/* 
	 		Cookie c = new Cookie("loginId", "");
			c.setPath("/");
			c.setMaxAge(0);
			response.addCookie(c); 
			위 코드와 아래 코드는 같은 코드
			*/
			
			CookieManger.deleteCookie(response, "loginId");
		}
			JSFunction.alertLocation("로그인에 성공했습니다.", "IdsaveMain.jsp", out);
		
		} else {
			JSFunction.alertBack("아이디나 비밀번호를 다시 확인해주세요", out);
			
		}
	%>

</body>
</html>