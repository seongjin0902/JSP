<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
body {
	width: 1024px;
	height: 860px;
	margin: 10px auto;
}

h1 {
	text-align: center;
	text-decoration-line: none;
	color: black;
	font-size: 50px;
	border-bottom: 5px solid;
	padding-bottom: 30px;
}

p {
	text-align: center;
	font-size: 18px;
	margin: 10px 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #ccc;
}

th {
	background-color: #f2f2f2;
}

.no-data {
	text-align: center;
	margin: 20px 0;
	font-size: 18px;
	color: #999;
}
</style>
</head>
<body>
	<h1>마이 페이지</h1>

	<p>Welcome, ${userId}!</p>

	<%-- DB에 저장된 정보를 가져오는 코드 --%>
	<c:if test="${empty mypageData}">
		<p class="no-data">데이터가 없습니다.</p>
	</c:if>

	<table>
		<tr>
			<th>Number</th>
			<th>ID</th>
			<th>Contents</th>
			<th>Date</th>
			<th>Hits</th>
			<th>Like</th>
		</tr>
		<c:forEach var="data" items="${mypageData}">
			<tr>
				<td>${data.number}</td>
				<td>${data.id}</td>
				<td>${data.content}</td>
				<td>${data.date}</td>
				<td>${data.hits}</td>
				<td>${data.like}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
