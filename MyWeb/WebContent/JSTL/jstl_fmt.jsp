<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>formatNumber, formatDate, parseNumber, parseDate</h2>
	<hr/>
	<!-- format은 형식을 바꿈, parse는 형변환   -->
	
	<c:set var="d01" value="2020"/>
	<h3>formatNumber는 숫자형식을 포맷하는 기능</h3> 
	<fmt:formatNumber var="v01" value="${d01 }" pattern="0000.000"/>
	 <!--var는 바꿀변수명, value에는 바꾸고싶은 값 (EL태그형식으로), pattern에는 어떤형식으로 바꿀건가(0은 자리수 의미)-->
	 ${d01 } <br/> <!-- 2020 -->
	 ${v01 } <br/> <!-- 2020.000 -->
	 
	 <fmt:formatNumber var="v02" value="${d01}" pattern="00000000"/>
	 ${v02 } <br/>
	 <hr/>
	 
	 <h3>formatDate는 날짜형식을 포맷하는 기능 (생각보다 많이 쓰임. 중요)</h3> 
	 <c:set var="d02" value="<%= new Date() %>" />
	 ${d02 } <br/> <!-- Thu May 06 10:32:56 KST 2021 -->
	 <fmt:formatDate var ="v03" value="${d02 }" pattern="yyyy/MM/dd HH:mm:ss"/> <!-- value에는 반드시 날짜형식이 들어있어야함. -->
	 ${v03 } <br/>
	 
	 <fmt:formatDate var="v04" value="${d02 }" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
	 ${v04 } <br/>	 
	 <hr/>
	 
	 <h3>parseNumber는 문자를 숫자로 변경</h3>
	 <fmt:parseNumber var="v05" value="1.100" pattern="0.000"/> <!-- parseInt메서드와 유사하고 value값에는 숫자형으로 변형될 수 있는 값이 들어와야합니다. -->
	 ${v05 } <br/> <!-- 숫자로 변경되어 이제 연산도 가능 -->
	 ${v05+10} <br/>
	 <fmt:parseNumber var="v06" value="1,123abc" type="number"/> <!-- pattern은 직접 형식을 지정하는것이고 type="number"는 숫자만 꺼내서 저장한다. -->
	 ${v06 }<br/>
	 
	 <hr/>
	 
	 <h3>parseDate는 문자를 날짜로 변경</h3>  <!-- 문자열로 넘어온 날짜형식의 계산이 필요할때 많이쓰임.중요 --> 
	 <c:set var="d03" value="2020/11/04"/> 
	 
	 <fmt:parseDate var="v07" value="${d03 }" pattern="yyyy/MM/dd"/>	<!-- formatDate로 하면  -->
	 ${v07 } <br/> <!-- Wed Nov 04 00:00:00 KST 2020 -->
	 <fmt:formatDate var="v08" value="${v07 }" pattern="yyyy/MM/dd"/>
	 ${v08 } <br/> <!-- 2020/11/04 -->
	 
	 <!-- 문자열 "2020/11/04" 을  날짜형"2020/11/04"로 만드려면 위의 두번의 과정을 거쳐야한다.-->
	 
	 <c:set var = "d04" value="2020-11-04 23:12:11"/>
	 <fmt:parseDate var="v09" value="${d04 }"  pattern="yyyy-MM-dd HH:mm:ss"/> <!-- pattern은 문자열의 형식대로 맞춰줘야함 -->
	 ${v09} <br/> <!-- Wed Nov 04 23:12:11 KST 2020 -->
	 <fmt:formatDate var="v10" value="${v09 }" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
	 ${v10 }<br/>
</body>
</html>