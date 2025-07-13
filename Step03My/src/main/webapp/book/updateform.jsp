<%@page import="test.dto.BookDto"%>
<%@page import="test.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. 파라미터로 전달되는 도서 번호를 읽어온다.
    int num = 0;
    try {
        num = Integer.parseInt(request.getParameter("num"));
    } catch(NumberFormatException e) {
        response.sendRedirect("list.jsp");
        return;
    }
    
    // 2. 해당 도서의 정보를 BookDao 객체를 이용해서 DB 에서 읽어온다.
    BookDto dto = BookDao.getInstance().getByNum(num);

    // 3. 만약 해당 번호의 도서가 존재하지 않으면 (dto가 null이면) 목록 페이지로 리다이렉트
    if (dto == null) {
        response.sendRedirect("list.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= dto.getTitle() %> 수정</title>
<style>
    body {
        font-family: sans-serif;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        /* 화려한 그라데이션 배경 */
        background: linear-gradient(135deg, #f0f2f5 0%, #c1cfe0 100%);
    }
    
    .container {
        max-width: 500px;
        width: 90%;
        padding: 40px;
        background-color: rgba(255, 255, 255, 0.95); /* 약간의 투명도 */
        border-radius: 20px; /* 모서리를 더 둥글게 */
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2); /* 그림자 효과 강화 */
        border: 1px solid rgba(255, 255, 255, 0.5);
        backdrop-filter: blur(5px); /* 배경 블러 효과 (일부 브라우저) */
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
        font-weight: 700;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1); /* 제목에 그림자 효과 */
    }

    form div {
        margin-bottom: 25px;
    }

    label {
        display: block;
        font-size: 14px;
        font-weight: bold;
        color: #555;
        margin-bottom: 8px;
    }

    input[type="text"] {
        width: calc(100% - 24px);
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        box-sizing: border-box;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }
    
    input[type="text"][readonly] {
        background-color: #e9ecef;
        cursor: not-allowed;
        border-color: #dee2e6;
    }

    input[type="text"]:focus:not([readonly]) {
        border-color: #3498db;
        box-shadow: 0 0 15px rgba(52, 152, 219, 0.5); /* 포커스 시 더 강한 글로우 효과 */
        outline: none;
    }

    .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 30px;
    }

    button[type="submit"], button[type="reset"] {
        flex: 1;
        padding: 14px; /* 패딩을 더 크게 */
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* 버튼 텍스트 그림자 */
    }
    
    button[type="submit"] {
        background-color: #3498db;
        color: #fff;
        margin-right: 10px;
    }

    button[type="submit"]:hover {
        background-color: #2980b9;
        transform: scale(1.05); /* 호버 시 약간 확대 */
    }

    button[type="reset"] {
        background-color: #e74c3c;
        color: #fff;
        margin-left: 10px;
    }

    button[type="reset"]:hover {
        background-color: #c0392b;
        transform: scale(1.05); /* 호버 시 약간 확대 */
    }
    
    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #555;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
    }
    
    .back-link:hover {
        color: #3498db;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>도서정보 수정 양식</h1>
        <form action="${pageContext.request.contextPath }/book/update.jsp" method="post">
            <div>
                <label for="num">번호</label>
                <input type="text" name="num" id="num" value="<%=dto.getNum() %>" readonly />
            </div>
            <div>
                <label for="title">제목</label>
                <input type="text" name="title" id="title" value="<%=dto.getTitle() %>" required />
            </div>			
            <div>
                <label for="author">저자</label>
                <input type="text" name="author" id="author" value="<%=dto.getAuthor() %>" required />
            </div>
            <div>
                <label for="publisher">출판사</label>
                <input type="text" name="publisher" id="publisher" value="<%=dto.getPublisher() %>" required />
            </div>
            <div class="button-group">
                <button type="submit">수정</button>
                <button type="reset">초기화</button>
            </div>		
        </form>
        <a href="${pageContext.request.contextPath }/book/list.jsp" class="back-link">도서 목록으로 돌아가기</a>
    </div>
</body>
</html>