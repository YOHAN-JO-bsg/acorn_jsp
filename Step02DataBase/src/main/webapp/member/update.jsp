<%@page import="test.dto.MemberDto"%>
<%@page import="test.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. form 전송되는 수정할 회원의 정보를 추출한다.
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	// 2.MemberDao 객체를 이용해서 DB 에 수정반영하기
	MemberDto dto = new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	
	boolean isSuccess = new MemberDao().update(dto);
	// 3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<div class="container">
		<h1>회원정보 수정 결과</h1>
		<% if (isSuccess) { %>
			<p>
				<strong>회원 정보를 수정했습니다.</strong>
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








