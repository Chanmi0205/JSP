<%@page import="oracle.net.aso.a"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 테스트</title>
</head>

	<% 
		// 생성자1 test
		JDBConnect jdbc1 = new JDBConnect();
		jdbc1.close();
		
		// 생정자2 test
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		
		JDBConnect jdbc2 = new JDBConnect(driver, url, id, pw);
		jdbc2.close();
		 
		// 생정자3 test
		JDBConnect jdbc3 = new JDBConnect(application);
		jdbc3.close();
	%>

</body>
</html>