<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!doctype html>
	<html lang="en" data-bs-theme="auto">
	  <head><script src="../assets/js/color-modes.js"></script>

	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	    <meta name="generator" content="Hugo 0.122.0">
	    <title>Carousel Template · Bootstrap v5.3</title>
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
	    
	    <script type="text/javascript">
		    var fnAlert = function() {
		        location.href="page";
		        alert('수정이 완료 되었습니다.');
		    }
	    </script>
	    
	    <!-- Custom styles for this template -->
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
			        <a class="nav-link" href="/guest/noticeBoard">공지사항</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">지도</a>
			      </li>
			      <li class="nav-item dropdown">
			         <a class="nav-link dropdown-toggle" href="guest/boardInfo" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="/guest/boardInfo">정보 게시판</a></li>
			            <li><a class="dropdown-item" href="#">인기 게시판</a></li>
			         	</ul>
			         </li>
			      <li class="nav-item dropdown">
			         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">문의사항</a>
			        <ul class="dropdown-menu">
			          <li><a class="dropdown-item" href="#">자주 물어보는 질문</a></li>
			          <li><a class="dropdown-item" href="guest/inquiryBoard">1대1문의</a></li>
			        </ul>
			      </li>
			   </ul>
			    <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">
                            <button type="button" class="btn btn-outline-light">
                                <i class="bi bi-box-arrow-right"></i> 로그아웃
                            </button>
                        </a>
                    </li>
                   <li class="nav-item">
                        <a class="nav-link" href="/admin/list">
                            <button type="button" class="btn btn-outline-light">
                                <i class="bi bi-person-lines-fill"></i> 회원관리페이지
                            </button>
                        </a>
                    </li>
                </ul>
			    </div>
			  </div>
			</nav>
		</header>
	
		<main>
			<div class="input-form-backgroud row">
			      <div class="input-form col-md-12 mx-auto">
			        <h4 class="mb-3">회원정보 수정 페이지</h4>
			       <table class="table">
			       		<tr>
			       			<th>아이디</th>
			       			<td>${dto.id}</td>
			       		</tr>
			       		<tr style="display:none;">
			       			<th style="display:none;">비밀번호</th>
			       			<td style="display:none;">${dto.pass}</td>
			       		</tr>
			       		<tr>
			       			<th>이름</th>
			       			<td>${dto.name}</td>
			       		</tr>
			       		<tr>
			       			<th>핸드폰번호</th>
			       			<td>${dto.phoneNum}</td>
			       		</tr>
			       		<tr>
			       			<th>이메일</th>
			       			<td>${dto.email}</td>
			       		</tr>
			       		<tr>
			       			<th>우편번호</th>
			       			<td>${dto.postcode}</td>
			       		</tr>
			       		<tr>
			       			<th>주소</th>
			       			<td>${dto.address}</td>
			       		</tr>
			       		<tr>
			       			<th>상세주소</th>
			       			<td>${dto.detailaddress}</td>
			       		</tr>
			       		<tr>
			       			<th>가입일</th>
			       			<td><fmt:formatDate value="${dto.regidate}" pattern="yyyy-MM-dd"/></td>
			       		</tr>
			       		<tr>
			       			<th>권한</th>
			       			<td>${dto.authority}</td>
			       		</tr>
			       		<tr>
			       			<th>잠금계정</th>
			       			<td>
					            <c:choose>
					                <c:when test="${dto.isLock == 1}">
					                    NO
					                </c:when>
					                <c:otherwise>
					                     LOCK
					                </c:otherwise>
					            </c:choose>
					        </td>
			       		</tr>
			       		<tr>
			       			<th>휴면계정</th>
			       			<td>
					        	 <c:choose>
					                <c:when test="${dto.enabled == 1}">
					                   활성화
					                </c:when>
					                <c:otherwise>
					                    휴면계정
					                </c:otherwise>
					            </c:choose>
					        </td>
			       		</tr>
			       </table>
			       <script type="text/javascript">
			       function confirmChanges(form, type) {
			           // 값을 저장하기 위한 변수
			           const previousValue = form.querySelector('select[name="' + type + '"]').dataset.previousValue;
			           const currentValue = form.querySelector('select[name="' + type + '"]').value;
			           
			           // 값이 변경되었는지 확인
			           if (previousValue !== currentValue) {
			               return confirm('변경사항이 있습니다. 계속하시겠습니까?');
			           } else {
			               alert('변경사항이 없습니다.');
			               return false; // 변경사항이 없으면 폼 제출을 막습니다.
			           }
			       }

			       // 폼 제출 전에 변경사항 확인을 위한 함수
			       function handleSubmit(event, type) {
			           event.preventDefault(); // 폼 제출 기본 동작을 막습니다.
			           if (confirmChanges(event.target, type)) {
			               // 사용자 확인 후 폼 제출
			               event.target.submit();
			               alert('수정이 완료되었습니다.');
			           }
			       }  
			       </script>
			       
				<div>
					<div class="d-inline-flex">
						<div class="justify-content-center">
						<form action="/admin/updateAuth" method="POST" onsubmit="handleSubmit(event, 'authority');" class="form-control" style="border: none; box-shadow: none;">
						    <input type="hidden" name="id" value="${dto.id}" />
						    <select name="authority"  data-previous-value="${dto.authority}">
						        <option value="ROLE_USER" ${dto.authority == 'ROLE_USER' ? 'selected' : ''}>회원</option>
						        <option value="ROLE_ADMIN" ${dto.authority == 'ROLE_ADMIN' ? 'selected' : ''}>관리자</option>
						    </select>
						    <button class="btn btn-outline-primary" type="submit">변경</button>
						</form>
						</div>
						<div class="justify-content-center">
						<form action="/admin/updateEnabled" method="POST" onsubmit="handleSubmit(event, 'enabled');" class="form-control" style="border: none; box-shadow: none;">
						    <input type="hidden" name="id" value="${dto.id}" />
						    <select name="enabled"  data-previous-value="${dto.enabled}">
						        <option value="1" ${dto.enabled == '1' ? 'selected' : ''}>활성화</option>
						        <option value="0" ${dto.enabled == '0' ? 'selected' : ''}>비활성화</option>
						    </select>
						    <button class="btn btn-outline-primary"  type="submit">변경</button>
						</form>
						</div>
						<div class="justify-content-center">
						<form action="/admin/updateLock" method="POST" onsubmit="handleSubmit(event, 'isLock');" class="form-control" style="border: none; box-shadow: none;">
						    <input type="hidden" name="id" value="${dto.id}" />
						    <select name="isLock"  data-previous-value="${dto.isLock}">
						        <option value="1" ${dto.isLock == '1' ? 'selected' : ''}>잠금해제</option>
						        <option value="0" ${dto.isLock == '0' ? 'selected' : ''}>잠금설정</option>
						    </select>
						    <button class="btn btn-outline-primary"  type="submit">변경</button>
						</form>
						</div>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						 <a class="nav-link" href="/admin/list">
						  <button class="btn btn-primary me-md-2" type="button">목록보기</button>
                        </a>
					</div>
				</div>		   
		   </div>
	    </div>
		 
		   <hr class="featurette-divider">  
	
		  <!-- FOOTER -->
		  <footer class="container">
		    <p class="float-end"><i class="bi bi-arrow-up-circle"></i><a href="#">Back to top</a></p>
		    <p>&copy; 2017–2024 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
		  </footer>
		</main>
	
		<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	 </body>
	</html>
