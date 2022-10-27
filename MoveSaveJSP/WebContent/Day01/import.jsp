<!-- error가 발생할 수 있을 경우 errorPage="파일명.jsp"를 작성하면
	error가 발생할 때 저 페이지로 넘어감 -->
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="IsErrorPage.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어 - import 속성</title>
</head>
<body>
	
		<% 
			//	Date today = new Date();
			try {
				int myAge = Integer.parseInt(request.getParameter("age")) + 10;
				out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
			} catch(Exception e) {
				// errorPage="파일명.jsp"보다 먼저 실행
				out.println("예외가 발생했지만 무사히 처리했습니다~!");
			}
			
			//	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-WW-dd");
			//	String todayStr = dateFormat.format(today);
			//	out.println("오늘 날짜 : " + todayStr); 
		%>
	
</body>
</html>