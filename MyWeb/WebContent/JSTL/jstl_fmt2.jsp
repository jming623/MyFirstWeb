<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>아래값을 yyyy-MM-dd형식으로 변경해서 출력 </h2>
	
	<c:set var="TIME_A" value="2020-05-03"/>
	<c:set var="TIME_B" value="2020/05-03 21:30:32" />
	<c:set var="TIME_C" value="<%=new Date() %>"/>
	
	<fmt:parseDate var="a" value="${TIME_A }" pattern="yyyy-MM-dd"/>
	<fmt:parseDate var="b" value="${TIME_B }" pattern="yyyy/MM-dd HH:mm:ss"/>
	
	<fmt:formatDate var="A" value="${a}" pattern="yyyy-MM-dd"/>
	<fmt:formatDate var="B" value="${b}" pattern="yyyy-MM-dd"/>
	<fmt:formatDate var="C" value="${TIME_C }" pattern="yyyy-MM-dd"/>
	
	TIME_A: ${A } <br/>
	TIME_B: ${B } <br/>
	TIME_C: ${C } <br/>
	
	
</body>
</html>