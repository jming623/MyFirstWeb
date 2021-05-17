<%@page import="com.myweb.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//(원래)세션값 사용하려면
	//UserVO vo = (UserVO)session.getAttribute("vo");
	//String auth = (String)session.getAttribute("auth");	
%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 세션값을 el태그로 참조하려면 sessionScope.이름 -->
	<!-- sessionScope는 생략할 수 있지만, 그냥 써주는게 좋음 -->
	auth : ${sessionScope.auth} <br/>
	아이디 : ${sessionScope.vo.id } <br/> <!-- getter메서드가 vo객체에 포함되어 있지않으면 오류!!! -->
	이름 : ${vo.name } <br/>  <!-- 이렇게도 사용가능 -->
	
	<!-- application은 applicationScope를 사용한다.  -->
	app(admin): ${applicationScope.admin } <br/>
</body>
</html>