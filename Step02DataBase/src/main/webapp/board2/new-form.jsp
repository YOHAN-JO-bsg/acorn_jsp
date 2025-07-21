<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board2/new-form.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h2>내가 만든 실습 게시판 작성 양식입니다~!</h2>
		<form action="save.jsp" method="post">
		
			<div class="mb-2">
				<label class="form-label" for="title">제목</label>
				<input class="form-control type="text" name="title" id="title" />
			</div>

			<div class="mb-2">
				<label class="form-label" for="content">내용</label>
				<input class="form-control" type="text" name="content" id="content" />
			</div>
			
			<button class="btn btn-danger btn-sm" type="submit">저장하기!</button>		
		</form>
	</div>
</body>
</html>










