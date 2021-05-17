<%@page import="com.myweb.model.UserVO"%>
<%@page import="com.myweb.model.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		이 페이지에 진입할 때 회원에 대한 정보를 조회
		1. 아이디는 세션에서 구해서 getInfo메서드를 호출하고 getInfo메서드는 아이디기반으로 회원정보를 조회해서 가지고 옵니다.
		2. 화면에 미리값이 보여지도록 처리	
	*/
	
	String id = (String)session.getAttribute("user_id");
	if(id == null){
		response.sendRedirect("login.jsp");
	}

	UserDAO dao = UserDAO.getInstance();
	
	UserVO vo = dao.getInfo(id);	
		
%>

<%@ include file="../include/header.jsp"%>
	
	<section>
		<div align="center">
			<h2>MVC1방식 회원정보 수정</h2>	
			<hr/>
			<form action="update_ok.jsp" method="post" name="updateForm">
				<table>
					<tr>
						<td>아이디:</td>
						<td><input type = "text" name = "id" value="<%=vo.getId() %>" readonly ></td>
					</tr>
					<tr>
						<td>비밀번호:</td>
						<td><input type="password" name="pw" placeholder="4글자이상"></td>
					</tr>
					<tr>
						<td>비밀번호 확인:</td>
						<td><input type="password" name="pwCheck" placeholder="4글자이상"></td>
					</tr>
					<tr>
						<td>이름:</td>
						<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
					</tr>
					<tr>
						<td>이메일:</td>
						<td><input type="text" name="email" value="<%=vo.getEmail() %>"></td>
					</tr>
					<tr>
						<td>주소:</td>
						<td><input type="text" name="address" value="<%=vo.getAddress() %>"></td>
					</tr>				
				</table>
				<br/>
				<input type="button" value="수정" onclick="check()"> 
				<input type="button" value="마이페이지" onclick="location.href='mypage.jsp'">
			</form>
		</div>
	</section>
	
	<script>
	function check(){				
		if(document.updateForm.id.value.length < 4){
			alert("아이디는 4글자 이상입니다.");
			document.updateForm.id.focus(); 
			return;
		}else if(document.updateForm.pw.value.length < 4){
			alert("비밀번호는 4글자 이상입니다.");
			document.updateForm.pw.focus();
			return;
		}else if(document.updateForm.pw.value != document.updateForm.pwCheck.value){
			alert("비밀번호 확인란을 확인하세요.");
			document.updateForm.pwCheck.focus();
			return;
		}else if(document.updateForm.name.value == ""){
			alert("이름은 필수 사항입니다.");
			document.updateForm.name.focus();
			return;
		}else{		
		 	document.updateForm.submit(); 
		}
	}
	</script>
	
<%@ include file="../include/footer.jsp"%>