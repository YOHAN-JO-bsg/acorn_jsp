<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-md bg-success" data-bs-theme="dark">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/member/list.jsp">Member</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/book/list.jsp">Book</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<h1>인덱스 페이지 입니다</h1>
		<ul>
			<li><a
				href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a></li>
			<li><a href="${pageContext.request.contextPath }/book/list.jsp">책목록</a></li>
		</ul>
		<div id="carouselExampleIndicators" class="carousel slide">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/top01.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="images/top02.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="images/top03.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<footer class="bg-primary text-white py-4 mt-5">
		<div
			class="container d-flex justify-content-between align-items-center flex-wrap">
			<div>
				<h5 class="mb-0">MyBrand</h5>
			</div>
			<div>
				<a href="#" class="text-white me-3"><i class="bi bi-facebook"></i></a>
				<a href="#" class="text-white me-3"><i class="bi bi-twitter"></i></a>
				<a href="#" class="text-white"><i class="bi bi-instagram"></i></a>
			</div>
		</div>
	</footer>
	<!-- bootstrap javascript 로딩하기 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
		crossorigin="anonymous">
	</script>
</body>
</html>




