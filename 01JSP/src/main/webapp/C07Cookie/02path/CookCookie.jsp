<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//KEY : VALUE
	//쿠키 생성
	Cookie cookie = new Cookie("c1","V1");
	cookie.setMaxAge(60*60); 	//쿠키 유지 시간 | -1(기본값) : 파일생성은 되지 않으나 브라우저가 종료될때까지 쿠키정보 저장,브라우저종료시 삭제
	cookie.setPath("/");		//모든 URL 에 쿠키 적용
	
	Cookie cookie2 = new Cookie("c2","V2");
	cookie2.setMaxAge(60*60);
	cookie2.setPath("./");		//현재폴더에만
	
	Cookie cookie3 = new Cookie("c3","V3");
	cookie3.setMaxAge(60*60);
	cookie3.setPath("/01JSP/C07Cookie/02path/test.jsp");	//지정된 URL로만 전달 
	
	//쿠키 전달
	response.addCookie(cookie);
	response.addCookie(cookie2);
	response.addCookie(cookie3);
%>

	<a href="Confirm.jsp">쿠키 확인</a>

</body>
</html>