<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정적 쿼리문 - 회원 조회</title>
</head>
<body>
	<h2>회원 목록 조회하기 - executeQuery() 메서드</h2>
	
	<%
		JDBConnect jdbc = new JDBConnect();
		
	String sql = "SELECT id, pass, name, regidate FROM member";
		Statement st = jdbc.conn.createStatement();
		
		ResultSet r = st.executeQuery(sql);
		
		while(r.next()) {
			String id = r.getString(1);
			String pw = r.getString(2);
			String name = r.getString("name");
			java.sql.Date regidate = r.getDate("regidate");
			
			out.println(String.format("회원 아이디 : %s, 비밀번호 : %s, 이름 : %s, 가입 날짜 : %s", id, pw, name, regidate) + "<br/>");
		}
		
		jdbc.close();
	%>
	
</body>
</html>