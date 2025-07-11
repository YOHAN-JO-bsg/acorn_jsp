<%@page import="test.dao.BookDao"%>
<%@page import="test.dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. form 전송되는 수정할 도서의 정보를 추출한다.
	// updateform.jsp 에서 readonly로 설정된 num 값도 다시 전송되어 옵니다.
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");         // 제목
	String author = request.getParameter("author");       // 저자
	String publisher = request.getParameter("publisher"); // 출판사
	
	// 2. BookDto 객체를 생성하고 추출한 정보를 담는다.
	BookDto dto = new BookDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setAuthor(author);
	dto.setPublisher(publisher);
	
	// 3. BookDao 객체를 이용해서 DB 에 수정 반영한다.
	// BookDao 에 update(BookDto dto) 메소드가 구현되어 있어야 합니다.
	boolean isSuccess = BookDao.getInstance().update(dto); // 싱글톤 패턴 사용 시
	// boolean isSuccess = new BookDao().update(dto); // 일반 객체 생성 시
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 수정 결과</title>
</head>
<body>
	<div class="container">
		<h1>도서 정보 수정 결과</h1>
		<% if (isSuccess) { %>
			<p>
				<strong>도서 정보를 성공적으로 수정했습니다.</strong>
				<a href="list.jsp">도서 목록 확인</a>
			</p>
		<% } else { %>
			<p>
				도서 정보 수정을 실패하였습니다. 다시 시도해주세요. 
				<a href="updateform.jsp?num=<%=num%>">다시 수정하러 가기</a>
			</p>
		<% } %>
	</div>
</body>
</html>