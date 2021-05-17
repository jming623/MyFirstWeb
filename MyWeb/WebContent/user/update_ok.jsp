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
	
	UserVO vo = new UserVO(id,pw,name,email,address,null);	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.update(vo);
	
	if(result == 1){ //업데이트 성공
		session.setAttribute("user_name", vo.getName());
%>		
	<script>
		alert("회원정보가 정상 수정되었습니다.");
		location.href="mypage.jsp";
	</script>	
<% 					
	}else{
%>
		<script>
			alert("회원정보 수정에 실패했습니다.");
			location.href="mypage.jsp";
		</script>
<%
	}
%>
