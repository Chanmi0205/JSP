<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	    
<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
	<body>
	
// 		    JDBConnect jdbc = new JDBConnect();

// 			String id = request.getParameter("id");
// 		    String pw = request.getParameter("pw");
// 		    String name = request.getParameter("name");
		    
// 		    System.out.println("id : " + id + ", pw : " + pw + ", name : " + name);
		   
// 			// ver1 - PreparedStatement 사용
// 			String sql2 = "SELECT id FROM member WHERE id=?";
// 			PreparedStatement ps2 = jdbc.conn.prepareStatement(sql2);
// 			ps2.setString(1, id);
// 			ResultSet r = ps2.executeQuery();
			
// 			// ver2 - Statement 사용
// 			/* String sql3 = "SELECT id FROM WHERE id=" + id;
// 			(import) Statement st = jdbc.conn.createStatement();
// 			st.excuteUpdate(sql3); */
			
			
// 			if(r.next()) {
				
// 				/* request.getRequestDispatcher("Register.jsp?error=1").forward(request, response);
// 				String error = request.getParameter("error");
// 				if(	error != null )	out.println("중복된 id입니다");
// 				jdbc.close(); */
				
// 				out.println("중복된 id입니다");
				
// 			} else if ( id != null && pw != null && name != null ) {
			
// 				String sql = "INSERT INTO member VALUES(?, ?, ?, sysdate)";
// 			    PreparedStatement ps = jdbc.conn.prepareStatement(sql);
// 			    ps.setString(1, id);
// 			    ps.setString(2, pw);
// 			    ps.setString(3, name);
			    
// 			    ps.executeUpdate();
// 		    	request.setAttribute("name", name);
// 				request.getRequestDispatcher("Welcome.jsp").forward(request, response);	
// 			}
			
// 			/*
// 				while(r.next()) {
// 					request.getRequestDispatcher("Register.jsp?error=1").forward(request, response);
// 					String error = request.getParameter("error");
// 					if(	error != null )	out.println("중복된 id입니다");
// 				}
// 			*/
// 			jdbc.close();	

	<% 
		String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        
        // 유저가 입력한 값을 DB에 삽입
        
        // 1. DB에 연결
        JDBConnect jdbc = new JDBConnect();

        // 유저가 입력한 id값이 DB 내에 이미 있다면 -> 중복된 id입니다
        // 아니라면 -> 회원가입 시켜주기
        
        String sql1 = "SELECT id FROM member WHERE id=?";
        PreparedStatement ps2 = jdbc.conn.prepareStatement(sql1);
        ps2.setString(1, id);
        ResultSet r = ps2.executeQuery();
        
        String sql3 = "INSERT INTO member VALUES(?, ?, ?, sysdate)";
                
        if(r.next()){
            // 중복 O
            // 중복된 ID입니다. 출력하도록 Dispatch
            jdbc.close();
            request.getRequestDispatcher("Register.jsp?error=1").forward(request, response);
        }
        else{
            // 중복X
            // 회원가입 처리 & welcome.jsp로 이동 
			PreparedStatement ps = jdbc.conn.prepareStatement(sql3);
        	ps.setString(1, id);
       	 	ps.setString(2, pw);
        	ps.setString(3, name);    
        	 
        	ps.executeUpdate();

           	jdbc.close();
            session.setAttribute("user_name", name);
            response.sendRedirect("Welcome.jsp");
        }
    %>
	
</body>
</html>
