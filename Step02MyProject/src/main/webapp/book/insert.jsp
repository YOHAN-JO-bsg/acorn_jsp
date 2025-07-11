<%@page import="test.dao.BookDao"%>
<%@page import="test.dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");

	BookDto dto = new BookDto();
	dto.setTitle(title);
	dto.setAuthor(author);
	dto.setPublisher(publisher);
	
	BookDao dao = new BookDao();
	boolean isSuccess = dao.insert(dto);	
	

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>