<%@page import="test.dao.MemberDao"%>
<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 회원 목록을 MemberDao 객체를 이용해서 얻어낸다
	List<MemberDto> list=new MemberDao().selectAll();
	//2. 응답한다 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
</head>
<body>
	<div class="container">
	<a href="${pageContext.request.contextPath }/member/insertform.jsp">회원 추가</a>
		<h1>회원 목록입니다</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(MemberDto tmp:list){ %>
				<tr>
					<td><%= tmp.getNum() %></td>
					<td><%= tmp.getName() %></td>
					<td><%= tmp.getAddr() %></td>
					<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
					<td><a href="${pageContext.request.contextPath }/member/delete.jsp?num=<%= tmp.getNum() %>">삭제</a></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>



