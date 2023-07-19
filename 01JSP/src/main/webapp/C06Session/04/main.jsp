<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script defer>
	//비동기 함수  : setInterval('함수명',반복시간); //반복시간마다 함수안의 로직을 수행 
	
	let max = <%=session.getMaxInactiveInterval()%>;
	
	function timer(){
		max = max-1;
		if(max<0){
			clearInterval(currTime);
			alert("세션기간이 만료되었습니다.");
			location.href="logout.jsp";
		}
		document.getElementById("timer").innerHTML=max;
	}
	let currTime = setInterval(timer,1000); 
</script>

<h1>MAIN</h1>
<p id=timer></p>
Userid : <%=session.getAttribute("userid") %><br>


<a href="logout.jsp">로그아웃</a>

</body>
</html>