<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
/*
	EL태그를 쓰면 이런작업이 필요없음.
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- param.태그네임 으로 한번에 받아서 사용합니다. -->
	${param.name }<br/>
	${param.id }<br/>
	${param.pw }<br/>
	
</body>
</html>