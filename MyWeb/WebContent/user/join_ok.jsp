<%@page import="com.myweb.model.UserVO"%>
<%@page import="com.myweb.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	//1. 회원아이디 중복검사
	UserDAO dao = UserDAO.getInstance();
	int result = dao.checkId(id); 
	
	if(result == 0){ //값이0이라면 중복 아이디
%>
	<script>
		alert("아이디가 중복 되었습니다.");
		history.go(-1); //한단계 뒤로가기
	</script>	
<%		
	}else{
		//2. 회원가입 진행
		UserVO vo = new UserVO(id,pw,name,email,address,null); //regdate는 null값 입력
		int result2 = dao.join(vo);//1이면 성공, 0이면 실패
		
		if(result2 == 1){
%>
	<script>
		alert("회원가입을 축하합니다.");
		location.href="login.jsp";
	</script>
<%			
		}else{
%>
	<script>
		alert("네트워크 오류입니다. 관리자에게 문의하세요.");
		location.href="join.jsp";
	</script>
<%			
		}
		
	}
%>