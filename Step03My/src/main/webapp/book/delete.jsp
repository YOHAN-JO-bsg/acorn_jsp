<%@page import="test.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. 파라미터로 전달되는 도서 번호를 읽어온다.
    int num = Integer.parseInt(request.getParameter("num"));
    
    // 2. BookDao 객체를 이용해서 DB 에서 해당 도서를 삭제한다.
    boolean isSuccess = BookDao.getInstance().deleteByNum(num); // MemberDao -> BookDao 로 변경, deleteByNum() 사용
    
    // 3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/delete.jsp</title>
<style>
	body {
		font-family: sans-serif;
		background-color: #f0f2f5;
		color : #333;
		margin: 0;
		padding : 0;
	}
	.container {
		max-width : 960px;
		margin : 40px auto;
		padding: 20px;
		background-color: #fff;
		border-radius : 12px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}
</style>
</head>
<body>
    <div class="container">
        <h1>도서 삭제 결과</h1>
        <% if (isSuccess) { %>
            <p>
                <strong>도서가 성공적으로 삭제되었습니다.</strong>
                <a href="list.jsp">도서 목록 확인</a>
            </p>
        <% } else { %>
            <p>
                도서 삭제에 실패하였습니다. 다시 시도해주세요.
                <a href="list.jsp">도서 목록으로 돌아가기</a>
            </p>
        <% } %>
    </div>
</body>
</html>