<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<section>
	<div align="center">
		<h2>MVC1방식 회원가입</h2>	
		<hr/>
		<form action="join_ok.jsp" method="post" name="regForm">
			<table>
				<tr>
					<td>아이디:</td>
					<td><input type = "text" name = "id" placeholder="4글자 이상"></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인:</td>
					<td><input type="password" name="pwCheck"></td>
				</tr>
				<tr>
					<td>이름:</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>이메일:</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>주소:</td>
					<td><input type="text" name="address"></td>
				</tr>				
			</table>
			<br/>
			<input type="button" value="가입" onclick="check()"> 
			<!-- onclick(클릭이라는 이벤트가 발생하면 실행시킬 키워드)뒤에는 순순한 자바스크립트 코드가 들어간다. -->
			<input type="button" value="로그인" onclick="location.href='login.jsp'">
		</form>
	</div>	
</section>

<script> //가입혹은 로그인 버튼을 누르면 작동할 코드
	//이 화면에서 사용할 js코드는 가장 아래쪽에 작성합니다. (이유는 나중에 다시 설명)
	function check(){
		//form값을 검증할 js코드
		//js에서 특정태그로 접근하는 방법
		//form태그는 문서의 하위자식 태그형태로 document.form태그이름.input태그이름 으로 접근가능
		//document.regForm.id //document에 regform폼에 id태그
		
		//console.log(document.regForm.id.value);  //console.log();는 브라우저 개발자도구(F12)에 콘솔창에 출력을 시켜주는 구문
		
		if(document.regForm.id.value.length < 4){
			alert("아이디는 4글자 이상입니다.");
			document.regForm.id.focus(); //포커스 함수는 해당위치에 마우스 포커싱
			return;//함수의 종료
		}else if(document.regForm.pw.value.length < 4){
			alert("비밀번호는 4글자 이상입니다.");
			document.regForm.pw.focus();
			return;
		}else if(document.regForm.pw.value != document.regForm.pwCheck.value){
			alert("비밀번호 확인란을 확인하세요.");
			document.regForm.pwCheck.focus();
			return;
		}else if(document.regForm.name.value == ""){
			alert("이름은 필수 사항입니다.");
			document.regForm.name.focus();
			return;
		}else{//위에 네가지 if문을 모두 통과했다면 이상없는것으로 간주 			
		 	document.regForm.submit(); //해당 폼태그의 서브밋
		}
	}
		
</script>


<%@ include file="../include/footer.jsp" %>