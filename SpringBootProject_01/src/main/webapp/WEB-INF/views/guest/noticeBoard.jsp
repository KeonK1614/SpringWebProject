<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!doctype html>
	<html lang="en" data-bs-theme="auto">
	<head>	 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	    <meta charset="utf-8">
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
		</style>	 
	  <link href="../carousel/carousel.css" rel="stylesheet">
	</head>
	
	<body>	
		<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
		  <symbol id="chat" viewBox="0 0 16 16">
		    <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.32.32 0 0 0-.12.366l.218.81a.6.6 0 0 1 .029.117.166.166 0 0 1-.162.162.2.2 0 0 1-.092-.03l-1.057-.61a.5.5 0 0 0-.256-.074.5.5 0 0 0-.142.021 5.7 5.7 0 0 1-1.576.22M9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.6.6 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.63.63 0 0 0 .098.356"/>
		    <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.5.5 0 0 0-.032.14.19.19 0 0 0 .193.193q.06 0 .111-.029l1.268-.733a.6.6 0 0 1 .308-.088q.088 0 .171.025a6.8 6.8 0 0 0 1.625.26 4.5 4.5 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02l.15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826m4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0m3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0"/>
		  </symbol>
		</svg>
		
		<div class="position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggl">
			<button class="btn btn-bd-primary py-2 d-flex align-items-center"
			        id="bd-theme"
			        type="button"
			        aria-expanded="false"
			        data-bs-toggle="button"
			        aria-label="채팅상담">
			  <svg class="bi my-1 theme-icon-active" width="1em" height="1em"><use href="#chat"></use></svg>
			  <a href="#" style="color: aliceblue; text-decoration: none;">채팅상담</a>
			  <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
			</button>
		</div>

		<header>
			<nav class="navbar navbar-expand-md fixed-top" style="background-color: #7FA1C3;">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="/">로고</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			   <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
			      <ul class="navbar-nav me-auto mb-2 mb-md-0">
			      <li class="nav-item">
			        <a class="nav-link" aria-current="page" href="#">홈페이지소개</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/guest/noticeBoard">공지사항</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">지도</a>
			      </li>
			      <li class="nav-item dropdown">
			         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="/guest/boardInfo">정보 게시판</a></li>
			            <li><a class="dropdown-item" href="#">인기 게시판</a></li>
			         	</ul>
			         </li>
			      <li class="nav-item dropdown">
			         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">문의사항</a>
			        <ul class="dropdown-menu">
			          <li><a class="dropdown-item" href="#">자주 물어보는 질문</a></li>
			          <li><a class="dropdown-item" href="inquiryBoard">문의게시판</a></li>
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
                            </button>
                        </a>
                    </li>
                </ul>
			</sec:authorize>
                <!-- 로그인된 상태 -->
            <sec:authorize access="hasRole('USER')">    
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">
                            <button type="button" class="btn btn-outline-light">
                                <i class="bi bi-box-arrow-right"></i> 로그아웃
                            </button>
                        </a>
                    </li>
                   <li class="nav-item">
                        <a class="nav-link" href="/member/mypage">
                            <button type="button" class="btn btn-outline-light">
                                <i class="bi bi-person-lines-fill"></i> 마이페이지
                            </button>
                        </a>
                    </li>
                </ul>
           </sec:authorize>
           
           <sec:authorize access="hasRole('ADMIN')">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">
                            <button type="button" class="btn btn-outline-light">
                                <i class="bi bi-box-arrow-right"></i> 로그아웃
                            </button>
                        </a>
                    </li>
                   <li class="nav-item">
                        <a class="nav-link" href="/member/mypage">
                            <button type="button" class="btn btn-outline-light">
                                <i class="bi bi-person-lines-fill"></i> 회원관리페이지
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
			<div class="col-10 pt-3 mt-3 mx-auto">
		         <!-- <h4>게시판 목록 - <small>공지사항게시판</small></h4> -->
		         <!-- <h4><strong>공지사항 게시판</strong></h4> -->
		
		         <!-- <div class="row">
		             검색부분
		             <h4><strong>공지사항 게시판</strong></h4>
		             <form method="get" class="d-flex">
		                <div class="input-group"style="width: 300px;">
		                
		                	<select name="searchField" class="form-control" dir="rtl">
		                         <option value="title">제목</option>
		                         <option value="content">내용</option>
			                </select>
						    <input class="form-control" type="text" name="searchWord" placeholder="Search" aria-label="Search" >
				            <button class="btn btn-outline-primary" type="submit"><i class="bi bi-search" style='font-size:20px'></i></button>
				        </div>
				     </form>  
		         </div> -->
		         
		         <nav class="navbar">
				  <div class="container-fluid">
				    <h4><strong>공지사항 게시판</strong></h4>
				    <form method="get" class="d-flex">
				    <c:choose>
				     <c:when test="${param.searchField == 'content'}">
				      <select name="searchField" required class="form-control" dir="rtl">
                         <option value="title">제목</option>
                         <option value="content">내용</option>
                         <option value="idx">글번호</option>
	                  </select>
	                 </c:when>
				     <c:when test="${param.searchField == 'idx'}">
				      <select name="searchField" required class="form-control" dir="rtl">
                         <option value="title">제목</option>
                         <option value="content">내용</option>
                         <option value="idx">글번호</option>
	                  </select>
	                 </c:when>
	                 <c:otherwise>
                 	  <select name="searchField" required class="form-control" dir="rtl">
                         <option value="title">제목</option>
                         <option value="content">내용</option>
                         <option value="idx">글번호</option>
	                  </select>
	                 </c:otherwise>
	                </c:choose>
				      <input class="form-control" type="text" name="searchWord" placeholder="Search" aria-label="Search" value="${searchWord}" >
		              <button class="btn btn-outline-primary" type="submit"><i class="bi bi-search" style='font-size:20px'></i></button>
				    </form>
				  </div>
				</nav>
		         
		         <div class="row mt-3 mx-1 mx-auto">
		             <!-- 게시판리스트부분 -->
		             <table class="table table-bordered table-hover table-striped">
		                 <colgroup>
		                     <col width="60px" />
		                     <col width="*" />
		                     <col width="120px" />
		                     <col width="120px" />
		                     <col width="80px" />
		                     <col width="60px" />
		                 </colgroup>
		                 	<thead>
			                     <tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
			                         <th>번호</th>
			                         <th>제목</th>
			                         <th>작성자</th>
			                         <th>작성일</th>
			                         <th>조회수</th>
			                         <th>추천</th>
			                     </tr>
			                 </thead>
			                 <tbody>
			                 <c:choose>
			                 	<c:when test="${ empty list }">
			                 		<tr>
			                 			<td colspan="6" align="center">
			                 				등록된 게시물이 없습니다.
			                 			</td>
			                 		</tr>
			                 	</c:when>
			                 	<c:otherwise>
								 <c:forEach items="${list}" var="dto"  varStatus="loop">
			                     	<tr>
			                     		<td align="center">${totalCount - (((pageNum-1) * pageSize) + loop.index)}</td>
			                     		<td>
			                     			<a href="noticeView?idx=${dto.idx}">${dto.title}</a>&nbsp;
											<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />				                     			
			                     			<c:if test="${dto.postdate == today}"><span class="badge rounded-pill text-bg-danger">New</span></c:if>
			                     			<c:if test="${ not empty dto.ofile }"><i class="bi bi-paperclip"></i></c:if>
			                     		</td>
			                     		<td align="center">${dto.id}</td>
			                     		<td align="center">${dto.postdate}</td>
			                     		<td align="center">${dto.viewCount}</td>
			                     		<td align="center">${dto.likeCount}</td>
			                     	</tr>
			                     </c:forEach>
			                     </c:otherwise>
			                 </c:choose>
			                 </tbody>
		             </table>
		         </div>
		         
		   		 <!-- 게스트 일 때 -->
                 <sec:authorize access="isAnonymous()">
                	 <div>
		               <div class="col d-flex justify-content-end">
		                   <button type="button" class="btn btn-primary" onclick="location.href='noticeBoard';">리스트보기</button>&nbsp;&nbsp;
		               </div>
			         </div>
                 </sec:authorize>
                 <!-- 로그인 멤버 -->
                 <sec:authorize access="hasRole('USER')">    
	             	<div>
		               <div class="col d-flex justify-content-end">
		                   <button type="button" class="btn btn-primary" onclick="location.href='noticeBoard';">리스트보기</button>&nbsp;&nbsp;
		               </div>
			         </div>
	             </sec:authorize>
	             <!-- 로그인 관리자 -->
	             <sec:authorize access="hasRole('ADMIN')">
	             	<div>
	             		<div class="col d-flex justify-content-end">
		                   <button type="button" class="btn btn-primary" onclick="location.href='noticeBoard';">리스트보기</button>&nbsp;&nbsp;
		                   <button type="button" class="btn btn-primary" onclick="location.href='../admin/noticeWriteForm';">공지사항 등록</button>
	               		</div>
	             	</div>
	             </sec:authorize>
	             
	             <div class="row mt-3">
		             <div class="col">
		                 <!-- 페이지번호 부분 -->
						 <div class="pagination justify-content-center">
		                     ${pagingImg}
		                 </div>
		             </div>
		         </div>
		     </div>
		</main>	 	
		<hr/> 	
		<!-- <footer class="container">
		    <p class="float-end"><i class="bi bi-arrow-up-circle"></i><a href="#">Back to top</a></p>
		    <h3><strong>더조은™</strong></h3>
		    <p class="copy text-center">
			    더조은아카데미일산 &nbsp;&nbsp;
		        경기도 고양시 일산구 중앙로 1275번길 38-10 201호(장항동 우림로데오스위트) <br/>
		        학생 : 김건, 김나현, 나예림, 장다빈 &nbsp;&nbsp;  
		        사업자등록번호 : 584-85-00825 &nbsp;&nbsp;  
		        TEL : 031.902.1777 &nbsp;&nbsp; 
				FAX : 031.906.8777 <br>
			</p>  
		    <p>&copy; 2017–2024 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
	  	</footer>	 -->
	  	
	   <!-- footer 태그 없이 화면 꽉차게  -->
       <p class="float-end"><i class="bi bi-arrow-up-circle"></i><a href="#">Back to top</a></p>
       <div class="p-4 text-white text-center" style="background-color: #7FA1C3;">
			 <div class="row">
				 <div class="col-2 ps-4">
				 <h3><strong>더조은™</strong></h3>
			 </div>
				 <div class="col">
					 <p class="copy text-center">
					    더조은아카데미일산 &nbsp;&nbsp;
				        경기도 고양시 일산구 중앙로 1275번길 38-10 201호(장항동 우림로데오스위트) &nbsp;&nbsp;<br/>
				        학생 : 김건, 김나현, 나예림, 장다빈 
				        사업자등록번호 : 584-85-00825 &nbsp;&nbsp;  
				        TEL : 031.902.1777 &nbsp;&nbsp; 
						FAX : 031.906.8777 <br>
					 </p>  
				 </div>
			 </div>
		 </div>	
	</body>
</html>
	

