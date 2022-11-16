<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./IsLoggedIn.jsp" %> <!-- 로그인 여부 체크 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"/>
	
	<h2>글쓰기(Write)</h2>
	
	<form action="WriteProcess.jsp" method="post">
		<table border="1" width="100%">
			<tr>  <td>제목</td> <td> <input type="text" name="title" style="width:99.4%" required/> </td> </tr>
			<tr> <td>내용</td> <td> <textarea style="width:99.55%; height:100px; resize:none" name="content" required></textarea> </td> </tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성 완료</button> 
					<button type="reset">다시 입력</button> 
					<button type="button" onclick="location.href='List.jsp';">목록 보기</button> 
				</td> 
			</tr>
		</table>
		
	</form>

</body>
</html>