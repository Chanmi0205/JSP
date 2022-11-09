<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="common.MemberDAO" %>
<%@ page import="common.MemberDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<%
	// MemberDAO : 필요한 액션
	// MemberDTO : 필요한 정보
		// form 데이터에서 유저의 입력값 받아오는 부분
		String userId = request.getParameter("userId");
    	String userPw = request.getParameter("userPw");
    	
    	//DB에 연결하기 위한 - web.xml에서 가져오기
    	String oracledriver = application.getInitParameter("OracleDriver");
    	String oracleUrl = application.getInitParameter("OracleURL");
    	String oracleId = application.getInitParameter("OracleId");
    	String oraclePw = application.getInitParameter("OraclePw");

    	MemberDAO dao = new MemberDAO(oracledriver, oracleUrl, oracleId, oraclePw);
		// 3번째 꺼 : MemberDAO dao = new MemberDAO(application);
    	
		MemberDTO dto = dao.getMemberDTO(userId, userPw);
		
		dao.close();
		
		if(dto.getId() != null) {
		      // 로그인 성공!!!!
		      session.setAttribute("userId", dto.getId());
		      session.setAttribute("UserName", dto.getName());
		      response.sendRedirect("LoginForm.jsp");
		  } else {
		      // 로그인 실패 :(
		      request.setAttribute("LoginErrMsg", "아이디나 비밀번호를 다시 확인해주세요.");
		      request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	   }
		
	%>
	
</body>
</html>