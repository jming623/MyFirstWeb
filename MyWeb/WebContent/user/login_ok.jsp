<%@page import="com.myweb.model.UserVO"%>
<%@page import="com.myweb.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	/*
		1.로그인에서 넘어오는 id,pw를 받습니다.
		2. DAO에 login(id,pw)메서드 생성
		3.login메서드 안에서 id,pw기준으로 로그인 검증을 시도합니다.
		로그인결과가 있다면 UserVO에 회원의 아이디와 이름을 저장하고 UserVO를 반환 받습니다.
		4. login_ok UserVO값이 null이 아니면 로그인성공, 세션에 아이디 이름을 저장
		mypage.jsp로 리다이렉트
		UserVO값이 null이라면 실패의미 script로 아이디비밀번호를 확인하세요를 출력한 뒤에 다시 로그인페이지로 이동.
	*/

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.login(id, pw);
	
	if(vo != null){//로그인 성공
		session.setAttribute("user_id", vo.getId());
		session.setAttribute("user_name", vo.getName());
		response.sendRedirect("mypage.jsp");
	}else{
%>
	<script>
		alert("아이디 패스워드를 확인하세요.");
		location.href="login.jsp";
	</script>
<%	
	}
	
%>