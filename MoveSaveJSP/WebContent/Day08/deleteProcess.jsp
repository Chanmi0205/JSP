<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="common.MemberDAO" %>
<%@ page import="common.MemberDTO" %>
<%@ page import="common.JDBConnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<%
		String userId = request.getParameter("userId");
    	String userPw = request.getParameter("userPw");
    	
    	// 유저의 id값을 받아오기(세션으로)
    	// String userId = session.getAttribute("UserId").toString();
    	
		String oracledriver = application.getInitParameter("OracleDriver");
    	String oracleUrl = application.getInitParameter("OracleURL");
    	String oracleId = application.getInitParameter("OracleId");
    	String oraclePw = application.getInitParameter("OraclePw");
    	
    	MemberDAO dao = new MemberDAO(oracledriver, oracleUrl, oracleId, oraclePw);
    	
        boolean result = dao.deleteUser(userId, userPw);

		if ( result == false ) {
			// 확인 실패

			request.setAttribute("ErrMsg", "아이디나 비밀번호를 다시 확인해주세요.");
			request.getRequestDispatcher("deleteForm.jsp").forward(request, response);
			System.out.println(userId + ", " + userPw);
			
			
		} else {
			
			// session.removeAttribute("UserId");
			// session.removettribute("UserName");
			session.invalidate();
			response.sendRedirect("LoginForm.jsp");
			System.out.println(userId + ", " + userPw);
			
			}
		
		dao.close();
		
	%>
			
	
</body>
</html>