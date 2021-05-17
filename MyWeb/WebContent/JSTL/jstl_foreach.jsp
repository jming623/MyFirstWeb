<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<h2>1~100까지 홀수의 합</h2>
	
<%	int sum = 0;
	for(int i = 1 ; i <= 100 ; i+=2){
		sum = sum + i;
	} %>
	
	결과:<%=sum %>
	<hr/>
	<!-- 위문장을 jstl문으로 작성해보자 -->
	<c:set var="total" value="0" /> <!-- 문자로적어도 숫자로 인식가능 -->
	
	<c:forEach var = "i" begin = "1" end = "100" step = "2" > <!-- step을 생략하면 자동으로 1로 설정됨 -->
		<!-- 그냥 사용하면 출력문임 -->
		 출력: total = total + i
		<c:set var = "total" value="${total + i}" />  
	</c:forEach>
	
	결과: ${total }

	<hr/>
	<h3>구구단3단</h3>
	<c:forEach var = "i" begin = "1" end= "9">
		3 X ${i } = ${3 * i} <br/>
	</c:forEach>
	
	<h3>2단부터 9단까지 구구단 출력</h3>
	<c:forEach var = "i" begin = "2" end = "9">
		<b>구구단 ${i }단</b><br/>
		<c:forEach var = "j" begin = "1" end = "9">
			${i } X ${j } = ${i*j } <br/>
		</c:forEach>
		<hr width="20%" align="left">
	</c:forEach>
	
	<!-- forEach구문을 향상된for문 형식으로도 사용할 수 있다.-->
	<h3>java의 향상된 for문</h3>
	<%
		int[] arr = new int[] {1,2,3,4,5};
		
		for(int i : arr){
			out.println(i);
		}
	%>
	
	<!-- jstl의 향상된for문 items -->
	<!--참고. varStatus="" 속성은 for문의 상태값을 확인 -->
	<h3>jstl의 향상된 for문</h3>
	<c:set var= "arr2" value="<%=new int[] {1,2,3,4,5} %>"/>
	<c:forEach var="i" items="${arr2 }" varStatus="s" > <!-- arr2에들어있는 값을 순차적으로 i에 담아서 처리할 수 있게 도와준다. -->
		${s.index }인덱스: ${i } <br/>
	</c:forEach>
	
	
	
</body>
</html>