<%@page import="test.dto.BoardDto2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 title 과 content
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//좋아하는 음식은 세션 객체로 부터 얻어낸다.
	String fav=(String)session.getAttribute("fav")
	//DB 에 저장하기
	BoardDto2 dto=new BoardDto2();
	dto.setFav(fav);
	dto.set
	// 글 번호를 미리 얻어낸다.
	
	// 글 번호도 dto 에 담는다
	
	//응답하기
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