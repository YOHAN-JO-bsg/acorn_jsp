<%@page import="test.dto.BookDto"%>
<%@page import="test.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. form 전송되는 수정할 도서의 정보를 추출한다.
    int num = Integer.parseInt(request.getParameter("num"));
    // String name = request.getParameter("name"); // 기존 이름
    // String addr = request.getParameter("addr"); // 기존 주소
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    
    // 2. BookDto 객체를 생성하고 추출한 정보를 담는다.
    BookDto dto = new BookDto(); // MemberDto -> BookDto 로 변경
    dto.setNum(num);
    dto.setTitle(title); // setName -> setTitle
    dto.setAuthor(author); // setAddr -> setAuthor
    dto.setPublisher(publisher); // setPublisher 추가
    
    // 3. BookDao 객체를 이용해서 DB 에 수정반영하기
    boolean isSuccess = BookDao.getInstance().update(dto); // MemberDao -> BookDao 로 변경, getInstance() 사용
    
    // 4. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/update.jsp</title>
</head>
<body>
    <div class="container">
        <h1>도서정보 수정 결과</h1>
        <% if (isSuccess) { %>
            <p>
                <strong>도서 정보를 성공적으로 수정했습니다.</strong>
                <a href="list.jsp">확인</a>
            </p>
        <% } else { %>
            <p>
                수정을 실패하였습니다. 다시 시도해주세요. <a href="updateform.jsp?num=<%=num%>">다시 수정하러 가기</a>
            </p>
        <% } %>
    </div>
</body>
</html>