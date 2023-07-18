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
	선언문
	JSP -> Servlet파일(Java)로 변환될 때 속성/Method를 구성하는데 사용
 -->
	<%!
	//변수추가
	String name = "Hong gil dong";

	//함수추가
	public String testFunc() {
		System.out.println("선언문 test");
		return name;
	}%>

	<%= name%><br />
	<%= testFunc()%> <br />

</body>
</html>