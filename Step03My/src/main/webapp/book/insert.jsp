<%@page import="test.dao.BookDao"%>
<%@page import="test.dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. form 전송되는 새 도서의 정보를 추출한다.
    // String name = request.getParameter("name"); // 기존 이름
    // String addr = request.getParameter("addr"); // 기존 주소
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    
    // 2. BookDto 객체를 생성하고 추출한 정보를 담는다.
    BookDto dto = new BookDto(); // MemberDto -> BookDto 로 변경
    dto.setTitle(title); // setName -> setTitle
    dto.setAuthor(author); // setAddr -> setAuthor
    dto.setPublisher(publisher); // setPublisher 추가
    
    // 3. BookDao 객체를 이용해서 DB 에 저장반영하기
    boolean isSuccess = BookDao.getInstance().insert(dto); // MemberDao -> BookDao 로 변경, getInstance() 사용
    
    // 4. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/insert.jsp</title>
</head>
<body>
    <div class="container">
        <h1>도서 추가 결과</h1>
        <% if (isSuccess) { %>
            <p>
                <strong>새 도서가 성공적으로 추가되었습니다!</strong>
                <a href="list.jsp">도서 목록 확인</a>
            </p>
        <% } else { %>
            <p>
                도서 추가에 실패하였습니다. 다시 시도해주세요.
                <a href="insertform.jsp">다시 추가하러 가기</a>
            </p>
        <% } %>
    </div>
</body>
</html>