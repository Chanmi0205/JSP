<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	    
<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - </title>
</head>
	<body>
	    <h1>회원가입</h1>
	    <form action="Register.jsp" method="post">
	        <label><strong>ID</strong> 
	            <input type="text" name="id" placeholder="ID를 입력하세요" required>
	        </label> 
	        <br>
	        <label><strong>Password</strong> 
	            <input type="password" name="pw" placeholder="비밀번호를 적어주세요" required>
	        </label>
	        <br>
	        <label><strong>Name</strong>
	            <input type="text" name="name" placeholder="영어 이름을 적어주세요" required>
	        </label>
	        <br>
	        <input type="submit" value="회원가입">
	    </form>
	
		<%
		    String id = request.getParameter("id");
		    String pw = request.getParameter("pw");
		    String name = request.getParameter("name");

		    JDBConnect jdbc = new JDBConnect();
		    
		    System.out.println("id : " + id + ", pw : " + pw + ", name : " + name);
		   
			// ver1 - PreparedStatement 사용
			String sql2 = "SELECT id FROM member WHERE id=?";
			PreparedStatement ps2 = jdbc.conn.prepareStatement(sql2);
			ps2.setString(1, id);
			
			// ver2 - Statement 사용
			/* String sql3 = "SELECT id FROM WHERE id=" + id;
			(import) Statement st = jdbc.conn.createStatement();
			st.excuteUpdate(sql3); */
			
			ResultSet r = ps2.executeQuery();
			
			if(r.next()) {
				out.println("중복된 id입니다");
		    } else if ( id != null && pw != null && name != null ) {
			    String sql = "INSERT INTO member VALUES(?, ?, ?, sysdate)";
			    PreparedStatement ps = jdbc.conn.prepareStatement(sql);
			    ps.setString(1, id);
			    ps.setString(2, pw);
			    ps.setString(3, name);
			    
			    ps.executeUpdate();
		    	request.setAttribute("name", name);
				request.getRequestDispatcher("Welcome.jsp").forward(request, response);	
		    }
			
			jdbc.close();	
			
    	%>
	
</body>
</html>