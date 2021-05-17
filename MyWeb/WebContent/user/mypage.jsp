<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//MYpage에 링크로 부적합한 접근을 막기위해
	if(session.getAttribute("user_id") == null){
		response.sendRedirect("login.jsp");
	}
	
	//세션에 저장된값
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
%>

<%@ include file="../include/header.jsp"%>

<section>
	<div align="center">
		<h2><%=id %>(<%=name %>)님의 개인정보를 관리합니다.</h2>
		
		<a href="logout.jsp">[로그아웃]</a> &nbsp;
		<a href="update.jsp">[정보수정]</a> &nbsp;
		<a href="delete.jsp">[회원탈퇴]</a> &nbsp;
		
	</div>
</section>

<%@ include file="../include/footer.jsp"%>