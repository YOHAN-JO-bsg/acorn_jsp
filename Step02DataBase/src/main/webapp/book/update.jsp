<%@page import="test.dao.BookDao"%>
<%@page import="test.dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
    // 1. form 전송되는 수정할 책 정보를 추출해서
    int num=Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	
	// 2.BookDto 객체에 담고
	BookDto dto = new BookDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setAuthor(author);
	dto.setPublisher(publisher);
	// 3.DB 에 수정반영하고 응답하기 
	// 
	boolean isSuccess=new BookDao().update(dto);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/update.jsp</title>
</head>
<body>
	<div class="container">
		<h1>도서 정보 수정결과</h1>
		<% if(isSuccess) { %>
			<p>
				<strong>도서 정보를 수정완료 했습니다.</strong>
			<a href="list.jsp">확인 후 돌아가기</a>
			</p>
		<% } else { %>
			<p>
				도서 정보 수정을 실패하였습니다. 다시 시도해주세요! <a href="updateform.jsp?num=<%=num%>">다시 수정하러 가기</a>
			</p>
		<% } %>
		
	<%-- html 응답하면서 javascript 를 로딩시키기 --%>		
	<script>
		<%if(isSuccess){%>
			alert("<%=title%> 책의 정보를 성공적으로 수행했습니다")
			// javascript 를 이용해서 페이지 이동 (redirect 효과를 낼 수 있다)
			lacation.href="list.jsp";
			<%} else {%>
				alert("수정 실패");
				// 다시 수정 폼으로 이동 시키기
				location.href="updateform.jsp?num=<%=num %>";			
		<%}%>
	</script>
	</div>
</body>
</html>