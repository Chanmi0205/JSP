<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- 확장자 생략 가능 -->
<%@ page import="common.Person" %>

<h2> Include된 완전히 다른 Page</h2>

<%
	int pIncludeInt = (Integer)pageContext.getAttribute("pageInt");
	String pIncludeString = pageContext.getAttribute("pageString").toString();
	Person pIncludePerson = (Person)pageContext.getAttribute("pagePerson");
%>

<%= pIncludeInt %> <br/>
<%= pIncludeString %> <br/>
<%= pIncludePerson.getName() %>, <%= pIncludePerson.getAge() %>
