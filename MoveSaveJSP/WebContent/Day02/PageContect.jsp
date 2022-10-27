<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 확장자 생략 가능 -->
<%@ page import="common.Person" %>

<%
	pageContext.setAttribute("pageInt", 1026);
	pageContext.setAttribute("pageString", "졸리지만 힘내보자");
	pageContext.setAttribute("pagePerson", new Person("박찬미", 18));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page 영역</title>
</head>
<body>

	<h2>원본 page</h2>

	<%
		int pInt = (Integer)pageContext.getAttribute("pageInt");
		String pString = pageContext.getAttribute("pageString").toString();
		Person pPerson = (Person)pageContext.getAttribute("pagePerson");
	%>
	
	<%= pInt %>
	<%= pString %>
	<%= pPerson.getName() %>, <%= pPerson.getAge() %>

	<%@include file="PageIncLude.jsp" %>
</body>
</html>