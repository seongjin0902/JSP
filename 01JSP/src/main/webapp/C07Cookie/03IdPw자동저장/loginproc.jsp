<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="BC" class="org.mindrot.bcrypt.BCrypt" scope="page" />
<%
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String idchk = request.getParameter("idchk");
	String pwdchk = request.getParameter("pwdchk");
	
	System.out.println("ID : " + userid);
	System.out.println("PW : " + pwd);
	System.out.println("IDCHK : " + idchk);
	System.out.println("PWCHK: " + pwdchk);


	Cookie id = new Cookie("userid",userid);
	
	//DB로 부터 받은 패스워드
	String dbpw = BC.hashpw("1234", BC.gensalt());

	
	
	if(!BC.checkpw(pwd, dbpw)){
		response.sendRedirect("login.jsp");
		return ; 
	}
	
	
	
	Cookie pw = new Cookie("pwd",pwd); 
	response.addCookie(id);
	response.addCookie(pw);
	
	if(idchk!=null)	//id저장체크가 되어있다면
	{
		Cookie ichk = new Cookie("idchk",idchk);	//id체크값(on문자열)을 저장한 쿠키 생성
		response.addCookie(ichk);	//클라이언트로 id체크 쿠키 전달
	}
	else //id저장체크가 안되어 있다면
	{
		//기존의 idchk를 찾아서 제거하는 작업
		Cookie [] cookies = request.getCookies();
		for(Cookie cookie :cookies){
			if(cookie.getName().equals("idchk")){
				cookie.setMaxAge(0); //쿠키 유지시간 0초
				response.addCookie(cookie); //클라이언트로 0초 쿠키 전달 
			}
		}	
	}
	
	if(pwdchk!=null){
		Cookie pchk = new Cookie("pwdchk", pwdchk);
		response.addCookie(pchk);
	}else{
		//기존의 pwdchk를 찾아서 제거하는 작업
		Cookie [] cookies = request.getCookies();
		for(Cookie cookie :cookies){
			if(cookie.getName().equals("pwdchk")){
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
	}
	
	
	response.sendRedirect("main.jsp");
	

	
	
%>


</body>
</html>