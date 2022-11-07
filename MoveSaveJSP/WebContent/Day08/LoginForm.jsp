<%@ page language="java" contentType="text/html; charset=UTf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션활용 로그인</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	
	<%= request.getAttribute("LoginErrMsg") == null ? " " : request.getAttribute("LoginErrMsg") %>
	
	<%
		if( session.getAttribute("user_Id") == null ) {
	%>

	<script>
		function vallidateForm(form) {
			if ( !form.user_id.value ) {
				alert("아이디를 입력하세요");
				return False;
			} 
			if ( !form.user_pw.value ) {
				alert("패스워드를 입력하세요!");
				return Flase;
			}
		}
	</script>
	<form action="LoginProcress.jsp" method="post" onsubmit="return vallidateForm(this)">
		아이디 : <input type="text" name="user_id"> <br/>
		패스워드 : <input type="password" name="user_pw"> <br/>
		<input type="submit" value="로그인">
	</form>
	
	<% 
		} else { 
	%>
		<%=session.getAttribute("UserName") %> 회원님, 환경합니다! <br/>
		<button type="button" onClick="location.href='Logout.jsp'">[로그아웃]</button>
		<button type="button" onClick="location.href='deleteForm.jsp'">[회원탈퇴]</button>
	<% 		
		}
	%>
	
</body>
</html>