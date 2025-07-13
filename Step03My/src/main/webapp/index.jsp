<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 600px;
        margin: 50px auto;
        background: #fff;
        padding: 30px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        border-radius: 10px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    ul {
        list-style: none;
        padding: 0;
    }
    li {
        margin: 15px 0;
    }
    a {
        text-decoration: none;
        font-size: 18px;
        color: #007BFF;
        transition: 0.3s;
    }
    a:hover {
        color: #0056b3;
        text-decoration: underline;
    }
    
</style>
</head>
<body>
    <div class="container">
        <h1>도서관리 시스템</h1>
        <ul>
            <li><a href="${pageContext.request.contextPath }/book/list.jsp">📚 도서 목록 보기</a></li>
            <li><a href="${pageContext.request.contextPath }/book/insertform.jsp">➕ 새 도서 추가하기</a></li>
        </ul>
    </div>
</body>
</html>
