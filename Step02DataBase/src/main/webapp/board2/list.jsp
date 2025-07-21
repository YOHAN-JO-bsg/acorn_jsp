<%@page import="java.util.List"%>
<%@page import="test.dto.BoardDto2"%>
<%@page import="test.dao.BoardDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//글목록 얻어오기
	List<BoardDto2> list = BoardDao2.getInstance().selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board2/list.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/include/navbar.jsp">
		<jsp:param value="board2" name="thisPage" />
	</jsp:include>

	<div class="container pt-1">
		<div class="container">
			<a class="btn btn-success btn-lg d-inline-block"
				href="new-form.jsp"> 새글을 작성해 보세요! <i class="bi bi-cup-hot-fill"></i>
			</a>
			<h2>내가 만든 실습 게시판 보기</h2>
			<table class="table table-borderd">
				<thead>
					<tr>
						<th>글번호</th>
						<th>좋아하는 음식</th>
						<th>싫어하는 음식</th>
						<th>좋아하는 취미</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<%for(BoardDto2 tmp:list) { %>
						<tr>
							<td><%=tmp.getNum() %></td>
							<td>
								<a href="view.jsp?num=<%=tmp.getNum()%>"<%=tmp.getFav() %>></a>
							</td>
							<td><%=tmp.getNotfav() %></td>
							<td><%=tmp.getHobby() %></td>
							<td><%=tmp.getCreatedAt() %></td>
						</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>








