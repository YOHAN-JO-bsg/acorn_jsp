<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
</head>
<body>
		<div class = "container">
			<h1>회원 정보 추가 양식</h1>
			<form action="${pageContext.request.contextPath }/book/insert.jsp" method = "post">
		<div>
				<label for="name">이름</label>
				<input type="text" name = "name" id = "name" />
		</div>
				<label for="addr">주소</label>
				<input type="text" name = "addr" id = "addr" />			
		</div>
		
		</div>
				<label for="author">주소</label>
				<input type="text" name = "author" id = "author" />			
		</div>
		
		</div>
				<label for="publisher">주소</label>
				<input type="text" name = "publisher" id = "publisher" />			
		</div>				
			<button type = "submit">추가</button>
		</form>
</body>
</html>