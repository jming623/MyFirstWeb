<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<c:set var = "num1" value="1"/>
	<c:set var = "num2" value="2"/>
	
	${num1 + num2} <br/>
	
	<c:if test="${num2 > num1}">
		num2가 num1보다 큽니다.
	</c:if>
	<br/>
	<c:forEach var="i" begin="1" end ="10">
		${num1 = num1 + i}
	</c:forEach>
		<br/>
	<c:forEach var="i" begin="1" end="10">
		<c:set var="num2" value="${num2 + i }"/>
	</c:forEach>	
		${num2}
		<br/>		
		<%-- <c:forEach var="i" begin="2" end="9">
			<b>구구단 ${i}단</b> <br/>
			<c:forEach var="j" begin = "1" end="9">
				${i} X ${j} = ${i*j}<br/>
			</c:forEach>
			<hr/>
		</c:forEach> --%>
		
		<c:set var="list" value="${list }"/>
	<c:forEach var="i" items="${list }">
		${i }
	</c:forEach>
	<br/>
	<c:set var="list2" value="<%=list %>" />
	<c:forEach var="i" items="${list2 }">
		${i }
	</c:forEach>	
		
</body>
</html>