<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head><script src="../assets/js/color-modes.js"></script>

	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	    <meta name="generator" content="Hugo 0.122.0">
	    <title>스마일로드</title>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
		<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

	    <style>
	      .bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        user-select: none;
	      }

	      @media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	          font-size: 3.5rem;
	        }
	      }

	      .b-example-divider {
	        width: 100%;
	        height: 3rem;
	        background-color: rgba(0, 0, 0, .1);
	        border: solid rgba(0, 0, 0, .15);
	        border-width: 1px 0;
	        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
	      }

	      .b-example-vr {
	        flex-shrink: 0;
	        width: 1.5rem;
	        height: 100vh;
	      }

	      .bi {
	        vertical-align: -.125em;
	        fill: currentColor;
	      }

	      .nav-scroller {
	        position: relative;
	        z-index: 2;
	        height: 2.75rem;
	        overflow-y: hidden;
	      }

	      .nav-scroller .nav {
	        display: flex;
	        flex-wrap: nowrap;
	        padding-bottom: 1rem;
	        margin-top: -1px;
	        overflow-x: auto;
	        text-align: center;
	        white-space: nowrap;
	        -webkit-overflow-scrolling: touch;
	      }

	      .btn-bd-primary {
	        --bd-violet-bg: #009E73;
	        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

	        --bs-btn-font-weight: 600;
	        --bs-btn-color: var(--bs-white);
	        --bs-btn-bg: var(--bd-violet-bg);
	        --bs-btn-border-color: var(--bd-violet-bg);
	        --bs-btn-hover-color: var(--bs-white);
	        --bs-btn-hover-bg: #6528e0;
	        --bs-btn-hover-border-color: #6528e0;
	        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	        --bs-btn-active-color: var(--bs-btn-hover-color);
	        --bs-btn-active-bg: #5a23c8;
	        --bs-btn-active-border-color: #5a23c8;
	      }
		  
		  .input-form {
		        max-width: 680px;
		        margin-top: 80px;
		        padding: 32px;
		        background: #fff;
		        -webkit-border-radius: 10px;
		        -moz-border-radius: 10px;
		        border-radius: 10px;
		        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		      }

	    </style>	    
	    <link href="../carousel/carousel.css" rel="stylesheet">

	  </head>
	  <body>	   
<header>
			<nav class="navbar navbar-expand-md fixed-top" style="background-color: #7FA1C3;">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="main">Carousel</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			   <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
			      <ul class="navbar-nav me-auto mb-2 mb-md-0">
			      <li class="nav-item">
			        <a class="nav-link" aria-current="page" href="#">home</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">공지사항</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">지도</a>
			      </li>
			      <li class="nav-item dropdown">
			         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="#">정보 게시판</a></li>
			            <li><a class="dropdown-item" href="#">인기 게시판</a></li>
			         	</ul>
			         </li>
			      <li class="nav-item dropdown">
			         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">문의사항</a>
			        <ul class="dropdown-menu">
			          <li><a class="dropdown-item" href="#">자주 물어보는 질문</a></li>
			          <li><a class="dropdown-item" href="#">1대1문의</a></li>
			        </ul>
			      </li>
			   </ul>
				  	<sec:authorize access="isAnonymous()">
				             <ul class="navbar-nav">
				                 <li class="nav-item">
				                     <a class="nav-link" href="/security/loginform">
				                         <button type="button" class="btn btn-outline-light">
				                             <i class='bi bi-box-arrow-in-right'></i> 로그인
				                         </button>
				                     </a>
				                 </li>
				                 <li class="nav-item">
				                     <a class="nav-link" href="/guest/joinform">
				                         <button type="button" class="btn btn-outline-light">
				                             <i class='bi bi-person-plus-fill'></i> 회원가입
				                         </button></a>
				                 </li>
				             </ul>
				</sec:authorize>
				             <!-- 로그인된 상태 -->
				<sec:authorize access="isAuthenticated()">    
				    <ul class="navbar-nav">
				        <li class="nav-item">
				            <a class="nav-link" href="/logout">
				                <button type="button" class="btn btn-outline-light">
				                    <i class="bi bi-box-arrow-right"></i> 로그아웃
				                </button>
				            </a>
				        </li>
				       <li class="nav-item">
				            <a class="nav-link" href="/member/myPage">
				                <button type="button" class="btn btn-outline-light">
				                    <i class="bi bi-person-lines-fill"></i> 마이페이지
				                </button>
				            </a>
				        </li>
				    </ul>
           </sec:authorize>
			    </div>
			  </div>
			</nav>
		</header>	
	  
		<main>
			<div class="input-form-backgroud row">
			      <div class="input-form col-md-12 mx-auto">
			        <h4 class="mb-3">마이 페이지</h4>
			        <form class="validation-form" novalidate method="post" action="/member/memberDelete">
			        
						<div class="mb-3">
						  <label for="id">성명</label>
						  <input type="text" class="form-control border" name="name" value="${dto.name}" readonly> 
						</div>
					
						<div class="mb-3">
						  <label for="id">아이디</label>
						  <input type="text" class="form-control border" name="id" value="${dto.id}" style="box-shadow: none;" readonly> 
						</div>
						
						<div class="mb-3">
						  <label for="id">휴대전화</label>
						  <input type="text" class="form-control border" name="phoneNum" value="${dto.phoneNum}" style="box-shadow: none;" readonly> 
					   </div>					
		
					  	<div class="mb-3">
						  <label for="id">이메일</label>
						  <input type="text" class="form-control border" name="email" value="${dto.email}" style="box-shadow: none;" readonly> 
						</div>	  
		
			           <div class="mb-3">
						  <label for="id">우편번호</label>
						  <input type="text" class="form-control border" name="postcode" value="${dto.postcode}" style="box-shadow: none;" readonly> 
						</div>	
						
			           <div class="mb-3">
						  <label for="id">주소</label>
						  <input type="text" class="form-control border" name="address" value="${dto.address}" style="box-shadow: none;" readonly> 
						</div>				  
			           <div class="mb-3">
						  <label for="id">상세주소</label>
						  <input type="text" class="form-control border" name="detailaddress" value="${dto.detailaddress}" style="box-shadow: none;" readonly> 
						</div>				  
	
			          <hr class="mb-4">		          
			          <div class="mb-3 text-end">	  
			            <c:if test="${isNormalUser}">
						  <button class="btn btn-outline-warning btn float-right" onclick="location.href='/member/pwUpdateView'" type="button">비밀번호 변경</button>
					  </c:if>
			          </div>
			          <button class="btn btn-outline-primary" onclick="location.href='/member/myPageEdit'" type="button">수정 하기</button>
			          <button class="btn btn-outline-danger" type="submit" onclick="confirmDeletion()">회원 탈퇴</button>
			        </form>
			      </div>
			    </div>
			    <script>
				    function confirmDeletion() {
				        if (confirm("정말 회원 탈퇴를 하시겠습니까?")) {
				            // 사용자 확인 후 폼 제출
				            document.querySelector('form').submit();
				        }
				    }
				</script> 
		   <hr class="featurette-divider">  	
		  <!-- FOOTER -->
		   <footer class="container">
		     <p class="float-end"><i class="bi bi-arrow-up-circle"></i><a href="#">Back to top</a></p>
		     <p>&copy; 2017–2024 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
		   </footer>
		</main>
	
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
	</body>
	</html>
