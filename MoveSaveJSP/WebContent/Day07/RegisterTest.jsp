<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 </title>

</head>
	<body>
	
	    <h1>회원가입</h1>
	    
	     <%
	        String error = request.getParameter("error");
	        if (error != null){
	            out.println("중복된 ID입니다.");
	        }
    	%>
    
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
	    </body>
    
	</head>	    
</html>