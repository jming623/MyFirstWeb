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

	<!-- else if구문: c:choose문을 사용합니다. 자식태그로 when태그가 들어갈 수 있음  (else구문은 otherwise로 사용가능)-->
	
	<c:choose>
		<c:when test="${param.name == '홍길동' }">
			홍길동 입니다.
		</c:when>
		<c:when test="${param.name == '이순신' }">
			이순신 입니다.		
		</c:when>
		<c:when test="${param.name == '홍길자' }">
			홍길자 입니다.
		</c:when>
		<c:otherwise> 
			셋다 아니라구요? 그럼누구세여..?
		</c:otherwise>
	
	</c:choose>
	
	<hr/>
	
	<c:choose>
		<c:when test="${param.age >= 20 }">
			성인입니다.
		</c:when>
		<c:otherwise>
			미성년자 입니다.
		</c:otherwise>
	</c:choose>
	
</body>
</html>