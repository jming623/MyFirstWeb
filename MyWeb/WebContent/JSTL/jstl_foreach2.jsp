<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	List<Integer> list = new ArrayList<>();
	list.add(1);
	list.add(2);
	list.add(3);
	list.add(4);
	list.add(5);
	
	request.setAttribute("list", list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>jstl에서 list사용하기</h3>
	<c:set var="list" value="${list }"/> <!-- requestScope가 생략됨 -->
	
	<c:forEach var="i" items="${list }">
		${i } <br/>	
	</c:forEach>
	
</body>
</html>