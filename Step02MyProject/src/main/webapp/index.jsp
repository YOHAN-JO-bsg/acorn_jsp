<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
</head>
<body>
	<div>
		<h1>내가 만든 인덱스 페이지</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath }/book/list.jsp">요리도서 목록</a></li>
		</ul>
	</div>
</body>
</html>