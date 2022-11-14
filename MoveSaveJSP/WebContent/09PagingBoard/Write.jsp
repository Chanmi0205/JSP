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
		
		<!--  
		< 페이지 기능 > 
		[ 한 페이지에 출력할 게시물 개수(POSTS_PER_PAGE) : 10개 ]
		[ 한 화면(블록)에 출력할 페이지 번호 개수(PAGES_PER_BLOCK) : 5개 ]
		
		1. 화면에 출력할 전체 레코드 수(게시물 데이터)를 세기
		ex. 전체 게시물 : 105개
		
		2. 한 페이지에서 출력할 게시물의 범위를 계산
		- 시작 게시물 범위 ( 전체 페이지 - 1 ) * POSTS_PER_PAGE + 1
		- 마지막(종료) 게시물 범위 : POSTS_PER_PAGE
		
		3. 전체 페이지 수 계산
		 = Mach.cail(전체 게시물 수 / POSTS_PER_PAGE)  
		 
		 4. 이전 페이지 블록 바로가기 출력
		 ((현재 페이지 - 1) / PAGES_PER_BLOCK) * PAGES PER_BLOCK + 1
		 if ( pageTmp == 1 ) 출력X
		 else pageTmp-1 결과로 이전 페이지 블록 바로가기 출력!
		 
		 5. 각 페이지 번호를 출력
		 4단계에서 계산한 pageTmp을 가지고 PAGES_PER_BLOCK만큼 반복하면서 +1씩 연산 후 출력
		 
		 ex. pageTmp = 1 -> 1, 2, 3, 4, 5 <<<6>>>
		 ex. pageTmp = 5 -> 6, 7, 8, 9, 10 <<<11>>>
		 
		 -->
		 
		 
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