<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">
<title>스마일 로드</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/carousel/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=SUSE:wght@100..800&display=swap')
	;
</style>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=New+Amsterdam&family=SUSE:wght@100..800&display=swap')
	;
</style>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=New+Amsterdam&family=Noto+Sans+KR:wght@100..900&family=SUSE:wght@100..800&display=swap')
	;
</style>
<link href="../files/style.css" rel="stylesheet">

</head>

<main>
	<%@ include file="../layout/header.jsp"%>
	<div id="myCarousel" class="carousel slide mb-6"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%"
						fill="var(--bs-light-border-subtle)" /></svg>
				<div class="container">
					<div class="carousel-caption text-start">
						<h1 class="new-amsterdam-regular">Smile Road</h1>
						<p>
							더 나은 길을 만들어가는 여정에 여러분의 참여를 환영합니다. 우리의 목표는 단순한 이동의 편리함을 넘어,<br />
							모두가 존중받고 배려받는 사회를 이루는 것입니다.
						</p>
					</div>
				</div>
			</div>

			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%"
						fill="var(--bs-warning-border-subtle)" /></svg>
				<div class="container">
					<div class="carousel-caption">
						<h1 class="noto-sans-kr">Smile Road</h1>
						<p>
							교통 약자들이 겪는 문제들을 개선하고, 모두가 행복한 미소를 지을 수 있는 세상을 위해 <br />
							<strong> 스마일 로드</strong>는 항상 앞장서겠습니다.
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%"
						fill="var(--bs-success-border-subtle)" /></svg>
				<div class="container">
					<div class="carousel-caption text-end">
						<h1 class="suse">Smile Road</h1>
						<p>
							스마일 로드는 장애인, 고령자, 임산부, 영유아를 동반한 사람, 어린이 등 <strong>교통약자</strong>의
							<br />이동권이 보장되는 사회를 만들기 위해 노력합니다.
						</p>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container marketing">
		<div class="row">
			<div class="col-lg-4">
				<img src="../static/restlogo.jpg" alt="화장실찾기 이미지"
					class="bd-placeholder-img rounded-circle" width="180" height="180">
				<h2 class="fw-normal">화장실찾기</h2>
				<p>현재 위치를 기반으로 주변에 교통약자들이 이용할 수 있는 화장실을 위치를 찾아드립니다.</p>
				<p>
					<a class="btn btn-secondary" href="#">View details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img src="../static/elvlogo.jpg" alt="엘레베이터찾기 이미지"
					class="bd-placeholder-img rounded-circle" width="180" height="180">
				<h2 class="fw-normal">승강기찾기</h2>
				<p>현재 위치를 기반으로 주변 지하철역의 엘리베이터 위치를 찾아드립니다.</p>
				<p>
					<a class="btn btn-secondary" href="#">View details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			<div class="col-lg-4">
				<img src="../static/inforlogo.jpg" alt="엘레베이터찾기 이미지"
					class="bd-placeholder-img rounded-circle" width="180" height="180">
				<h2 class="fw-normal">정보 게시판</h2>
				<p>교통 약자들이 일상 생활에서 필요한 교통 정보와 편의시설에 대한 정보를 공유하고, 서로 도움을 주고받기 위한
					게시판으로 이동합니다.</p>
				<p>
					<a class="btn btn-secondary" href="#">View details &raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
		</div>
		<!-- /.row -->
	</div>

	<hr class="featurette-divider">

</main>
<%@ include file="../layout/footer.jsp"%>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
