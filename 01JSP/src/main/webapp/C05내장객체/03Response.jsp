<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>03RESPONSE</h1>
<%@page import="java.io.*" %>
<%
	//Redirect 경로 지정
	//response.sendRedirect("01PageContext.jsp");

	//Response 헤더 정보 변경
	//response.setIntHeader("Refresh", 3);

	//Response.outStream 꺼내오기
	//ServletOutputStream bout = response.getOutputStream();
	//bout.write(123);
	//bout.flush();
	//bout.close();
	
	PrintWriter o = response.getWriter();
	o.println("<h2>test</h2>");
	
	
%>
</body>
</html>