<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- prefix로 선언해놓은 이름 뒤에 콜론(:)을 붙혀 명령 prefix는 종류별로 규격화된 이름이있다. c = Core , fmt = Formatting -->
	<!-- Core 라이브러리는 기본적인 라이브러리로 출력, 제어문, 반복문 같은 기능이 포함되어 있습니다. -->
	<!-- jstl도 시작태그와 끝태그가 있다. 만약 추가로 종속된 태그가 없으면 /로 마감처리 합니다. -->
	<c:set var = "num" value = "1" /> <!-- var는 변수명 value는 값 (=변수num의 값은 1이다.) -->
	<!-- 변수출력 -->
	<c:out value = "${num }" />
	
	<hr/>
	
	<!-- test는 조건이 들어갑니다. -->
	<c:if test="true"> <!-- if(true)와 같음 -->
		<p>jstl을 사용한 무조건 실행되는 문장^^</p>
	</c:if>
	
	<% if(true){ %>
		<p>if문을 사용한 무조건 실행되는 문장^^</p>
	<%} %>
	
	<hr/>
	
	<c:if test="${num eq 1 }"> <!-- if(num == 1)와 같음 -->
		<p>num은 1이네요~</p>
	</c:if>
	
	<hr/>
	<!-- form을 통해 넘어오는 값을 EL태그와 JSTL태그를 사용하여 한번에 사용가능 -->
	<h2>파라미터값을 el jstl로 받기</h2>
	
	<c:if test="${param.name eq '홍길동' }">
		홍길동 입니다.
	</c:if>
	<c:if test="${param.name == '이순신' }"> <!-- EL태그안에서는 문자열의 비교도 (==)을 사용할 수 있다. -->
		이순신 입니다.
	</c:if>
	<hr/>
	
	<!-- age파라미터값이 20이상이면 성인입니다. 미만이면 미성년자입니다 출력. -->
	<c:if test="${param.age >= 20 }">
		성인입니다.
	</c:if>
	<c:if test="${param.age < 20 }">
		미성년자입니다.
	</c:if>
	
	
	
</body>
</html>