<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--  
	쿠키 특징
	문자열 데이터로만 저장
	4kbyte 이하의 공간을 차지
	여러개의 쿠기 설정가능(최대 300개)
	도메인당 20개까지 저장 가능
	저장한도를 초과하면 최근에 사용되지 않는 쿠키부터 자동 삭제 
-->
<%
	//KEY : VALUE
	//쿠키 생성
	Cookie cookie = new Cookie("mycookie1","Value1");
	cookie.setMaxAge(60*60); 	//쿠키 유지 시간 | -1(기본값) : 파일생성은 되지 않으나 브라우저가 종료될때까지 쿠키정보 저장,브라우저종료시 삭제

	Cookie cookie2 = new Cookie("mycookie2","Value2");
	cookie2.setMaxAge(60*60);
	
	//쿠키 전달
	response.addCookie(cookie);
	response.addCookie(cookie2);
	
%>

	<a href="Confirm.jsp">쿠키 확인</a>

</body>
</html>