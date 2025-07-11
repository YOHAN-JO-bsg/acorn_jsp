<%@page import="test.dto.BookDto"%> <%-- MemberDto 대신 BookDto import --%>
<%@page import="test.dao.BookDao"%> <%-- MemberDao 대신 BookDao import --%>
<%@page import="java.util.List"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // BookDao 를 이용해서 도서 목록을 가져온다.
    List<BookDto> list = BookDao.getInstance().selectAll(); // 싱글톤 패턴 적용시
    // List<BookDto> list = new BookDao().selectAll(); // 싱글톤 미적용시
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/list.jsp</title> 
</head>
<body>
    <div class = "container">
    <a href="${pageContext.request.contextPath }/book/insertform.jsp">도서 추가</a> 
        <h1>도서 목록입니다</h1>
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
            <% for(BookDto tmp : list) { %> 
                <tr>
                    <td><%= tmp.getNum() %></td>
                    <td><%= tmp.getTitle() %></td> <%-- tmp.getName() 대신 tmp.getTitle() --%>
                    <td><%= tmp.getAuthor() %></td> <%-- tmp.getAddr() 대신 tmp.getAuthor() --%>
                    <td><%= tmp.getPublisher() %></td>
                    <td><a href="${pageContext.request.contextPath}/book/updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>