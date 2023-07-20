<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수지정 -->
	<c:set var="num" value="123"  />
	<!-- 변수출력 -->
	<c:out value="${num}" /><br/>
	${num}<br/>
	<!-- 배열지정 -->
	<c:set var="arr" value="${[10,20,30,40,50]}" />
	<c:out value="${arr}" /><br/>
	<c:out value="${arr[2]}" /><br/>
	
	<!-- if문 -->
	<c:set var="flag" value="true" />
	<c:if test="${empty flag }">
		<c:out value="[IF] TRUE!!!" />
	</c:if>
	<c:if test="${not empty flag }">
		<c:out value="[IF] FALSE!!!" />
	</c:if>	
	
	<!-- choose -->
	<c:choose>
		<c:when test="${flag eq 'a'}">
			<c:out value="[Choose] A!!" />
		</c:when>
		<c:when test="${flag eq 'b'}">
			<c:out value="[Choose] B!!" />
		</c:when>	
		<c:when test="${flag eq 'c'}">
			<c:out value="[Choose] C!!" />
		</c:when>
		<c:otherwise>
			<c:out value="[Choose] ETC!!" />
		</c:otherwise>
	</c:choose>
	<hr/>
	
	<!-- forEach -->
	
	<c:set var="end" value="15" />
	<c:forEach var="i" begin="1" end="${end}" step="2">
		<c:out value="${i}" />
	</c:forEach>
	<hr/>
	<c:set var="array" value="10,20,30,40,50,60,70" />
	<c:forEach var="i" items="${array }" varStatus="status" >
		VAL : <c:out value="${i}" /> | IDX ${status.index } | CNT ${status.count }<br/>
	</c:forEach>
	
	<hr/>
	<!-- URL ContextPath경로 자동 추가 / 쿠키차단시 SessionId를 포함해서 전달 -->
	<a href="${requestScope.getContextPath}01RequestForm.jsp">URL 태그x </a><br/>
	<a href="<c:url value="01RequestForm.jsp" />"  > URL 태그o</a>

	
</body>
</html>