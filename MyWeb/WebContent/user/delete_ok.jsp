<%@page import="com.myweb.model.UserVO"%>
<%@page import="com.myweb.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. 사용자가 직접 화면에서 입력한 비밀번호 값과 아이디를 기반으로 login()메서드를 재활용해서 사용자를 검증합니다.
		2. login()가 null을 반환하면 "현재 비밀번호를 확인하세요"를 출력하고 뒤로가기.
		3. login()가 값을 가진다면 delete메서드를 작성하고 삭제진행 
		4. 삭제성공시 세션을 모두 지우고, index.jsp페이지로 리다이렉트 시켜줍니다. 
		5. 삭제 실패시 경고창을 띄우고 mypage.jsp로 리다이렉트		
	*/
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("user_id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.login(id, pw);
	
	if(vo != null){ //패스워드 일치
		int result = dao.delete(id);
		
		if(result == 1){ //삭제성공
			session.invalidate();
%>
	<script>
		alert("회원탈퇴에 성공하였습니다.")
		location.href="../index.jsp";
	</script>
<%			
		}else{//삭제실패
%>
	<script>
		alert("회원탈퇴이상 관리자에게 문의하세요.");
		location.href="mypage.jsp";
	</script>
<%			
		}
		
	}else{ //비밀번호 불일치
%>
	<script>
		alert("현재 비밀번호를 확인하세요.");
		history.go(-1);
	</script>
<%		
	}
%>