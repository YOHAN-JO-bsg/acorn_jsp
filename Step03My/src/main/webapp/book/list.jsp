<%@page import="test.dao.BookDao"%>
<%@page import="test.dto.BookDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. BookDao 객체를 이용해서 DB에 저장된 전체 도서 목록을 얻어낸다.
    // BookDao는 싱글톤 패턴으로 구현되었으므로 getInstance()를 통해 객체를 얻습니다.
    List<BookDto> list = BookDao.getInstance().selectAll(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/list.jsp</title>
<style>
    body {
        font-family: sans-serif;
        background-color: #f0f2f5;
        color: #333;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 960px;
        margin: 40px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 20px;
        font-weight: 700;
    }

    /* 링크 버튼 스타일 */
    .button-link {
        display: inline-block;
        padding: 10px 20px;
        margin-bottom: 20px;
        background-color: #3498db;
        color: white;
        text-align: center;
        text-decoration: none;
        border-radius: 8px;
        transition: background-color 0.3s ease;
    }

    .button-link:hover {
        background-color: #2980b9;
    }

    /* 테이블 컨테이너 (반응형) */
    .table-container {
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 12px;
        overflow: hidden; /* 테두리 둥글게 */
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
    }

    thead {
        background-color: #34495e;
        color: #fff;
    }

    tbody tr:nth-child(odd) {
        background-color: #f9f9f9;
    }

    tbody tr:hover {
        background-color: #ecf0f1;
        transition: background-color 0.3s ease;
    }

    /* 테이블 내 버튼 링크 */
    .table-button-link {
        color: #3498db;
        text-decoration: none;
        padding: 5px 10px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .table-button-link.edit {
        color: #27ae60; /* 녹색 */
    }
    .table-button-link.edit:hover {
        background-color: #e8f8f5;
    }

    .table-button-link.delete {
        color: #e74c3c; /* 빨간색 */
    }
    .table-button-link.delete:hover {
        background-color: #fdeee7;
    }

    /* 데이터 없을 때 메시지 */
    .empty-message {
        text-align: center;
        padding: 20px;
        font-style: italic;
        color: #7f8c8d;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>도서 목록</h1>
        <a href="${pageContext.request.contextPath }/book/insertform.jsp" class="button-link">새 도서 추가</a>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>저자</th>
                        <th>출판사</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                <% 
                if (list.isEmpty()) { 
                %>
                    <tr>
                        <td colspan="6" class="empty-message">등록된 도서가 없습니다.</td>
                    </tr>
                <% 
                } else {
                    for(BookDto tmp : list){ 
                %>
                    <tr>
                        <td><%= tmp.getNum() %></td>
                        <td><%= tmp.getTitle() %></td>
                        <td><%= tmp.getAuthor() %></td>
                        <td><%= tmp.getPublisher() %></td>
                        <td><a href="${pageContext.request.contextPath}/book/updateform.jsp?num=<%=tmp.getNum() %>" class="table-button-link edit">수정</a></td>
                        <td><a href="${pageContext.request.contextPath }/book/delete.jsp?num=<%= tmp.getNum() %>" class="table-button-link delete">삭제</a></td>
                    </tr>
                <% 
                    } 
                } 
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>