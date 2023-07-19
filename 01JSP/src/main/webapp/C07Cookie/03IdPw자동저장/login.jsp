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
		Cookie[] cookies = request.getCookies();
		String userid=null;
		String pwd = null;
		String idchk=null;
		String pwdchk=null;
		if(cookies!=null)
		{
			
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("userid")){
					userid=cookie.getValue();
				}
				if(cookie.getName().equals("pwd")){
					pwd=cookie.getValue();
				}	
				if(cookie.getName().equals("idchk")){
					idchk=cookie.getValue();
				}
				if(cookie.getName().equals("pwdchk")){
					pwdchk=cookie.getValue();
				}
			}
		}
		
	%>

	<form action="loginproc.jsp" method="post">
		<input type=text name=userid value="<%=(idchk!=null)?userid:"" %>"  /><br>
		<input type=password name=pwd  value="<%=(pwdchk!=null)?pwd:"" %>" /><br>
		
		<%
		if(idchk!=null)
			out.println("<input type=checkbox name=idchk  checked/> ID저장");
		else
			out.println("<input type=checkbox name=idchk  /> ID저장");	
		
		if(pwdchk!=null)
			out.println("<input type=checkbox name=pwdchk  checked/>PW저장<br>");
		else
			out.println("<input type=checkbox name=pwdchk  />PW저장<br>");	
		%>		
		
	 
		
		
		<input type="submit" value="로그인"/>
		
	</form>
</body>
</html>