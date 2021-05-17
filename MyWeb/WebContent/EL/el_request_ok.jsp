<%@page import="com.myweb.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//(원래)request로 저장한값을 불러오는 방법
	//UserVO vo = (UserVO)request.getAttribute("vo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- EL태그를 사용하면 (requestScope)  -->
	<!-- requestScope는 많이들 생략을 하고  사용한다.(session,application은 생략X request는 생략O)--> 
	아이디: ${requestScope.vo.id } <br/>
	이름: ${vo.name } <br/>
	
	
	
</body>
</html>