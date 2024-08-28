<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

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
		
		<script type="text/javascript">
		   function movePage(page) {

		        const form = document.getElementById('searchForm');

		        const queryParams = {
		            searchField: form.searchField.value,
		            searchWord: form.searchWord.value
		        }
		        location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
		    }
		    
		   function boardPassPop(){ //로그인 안되어 있을때
				  var answer = window.confirm("비회원은 열람이 불가능합니다. 로그인 하시겠습니까?");
				    	   		if(answer==true){
				    	   			window.open("../security/loginform");
				    	   		return window.histroy.back();
				    	   		}
				/* <sec:authorize access="!isAnonymous()"> // 로그인이 되어있을때
					alert("작성자 본인만 열람이 가능합니다.");
				</sec:authorize> */
		   } 
		   
		   function memberBoardPassPop(idx){ // 작성자와 아이디가 같다면 비밀번호 검색창으로 
			   var s_width = window.screen.width;
               var s_height = window.screen.height;            
               
               var leftVar = s_width/2 - 500/2;
               var topVar = s_height/2 - 500/2;
              
               window.open("../member/inquiryBoardPass?idx="+idx, "popup", 
                   "width=600,height=380,left="+leftVar+",top="+topVar);
		   } 
		   
		   function boardPassPop2(){
			   alert("작성자 본인만 열람이 가능합니다.");
		   } 
		   
		</script>
		<script>
			function chatPop(){
				var s_width = window.screen.width;
				var s_height = window.screen.height;            
				
				var leftVar = s_width/2 - 500/2;
				var topVar = s_height/2 - 500/2;
				
				window.open("webscoketPopup", "popup", 
				    "width=600,height=250,left="+leftVar+",top="+topVar);
			}
		
		</script>
		
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
		
		<style type="text/css">
		 /* link - 아직 클릭하지 않은 경우 */
		 a:link { color: black; text-decoration: none;}	
		 /* visited - 한번 클릭하거나 전에 클릭한적 있을 경우 */
		 a:visited { color: bule; text-decoration: none;}	
		 /* hover - 마우스를 해당 링크에 위치했을 경우*/
		 a:hover { color: black; text-decoration: underline;}
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
		
		<%-- <c:if test="${not empty pageContext.request.userPrincipal }"> --%>
			<div class="position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggl">
				<button class="btn btn-bd-primary py-2 d-flex align-items-center"
				        id="bd-theme"
				        type="button"
				        aria-expanded="false"
				        data-bs-toggle="button"
				        aria-label="채팅상담"
				        onclick="chatPop();">
				        채팅상담
				        <!-- onclick="location.href='../member/client';"> -->
				  <svg class="bi my-1 theme-icon-active" width="1em" height="1em"><use href="#chat"></use></svg>
				  <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
				</button>
			</div>
		<%-- </c:if> --%>

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
			  	<ul class="navbar-nav">
			      	<li class="nav-item">
			       	<a class="nav-link" href="login">
			       	<button type="button" class="btn btn-outline-light">
			       	<i class='bi bi-box-arrow-in-right'></i> 로그인</button></a>
			     	</li>
			      	<li class="nav-item">
			       	<a class="nav-link" href="join">
			       	<button type="button" class="btn btn-outline-light">
			       	<i class='bi bi-person-plus-fill'></i> 회원가입</button></a>
			     	</li>
			     	</ul>
			    </div>
			  </div>
			</nav>
		</header>
	
		<main>
		     <div class="col-10 pt-3 mt-3 mx-auto">
		     <h3>문의게시판</h3>
		     <small>
		     	<c:if test="${ not empty searchWord }">
				    	전체&nbsp;${totalCount}건&nbsp;${ pageNum}/${totalCount}
				</c:if>
		     </small>
		     <hr>
				<div class="row">
		             <!-- 검색부분 -->
					<form method="get" id="searchForm"> 
						<div class="input-group ms-auto" style="width: 300px; ">
							<c:choose>
								<c:when test="${searchField == 'title'}">
									<select name="searchField" class="form-control">
									    <option value="title" selected="selected">제목</option>
									    <option value="id">작성자</option>
									    <option value="content" >내용</option>
									</select>
								</c:when>
								<c:when test="${searchField == 'id'}">
									<select name="searchField" class="form-control">
									    <option value="title">제목</option>
									    <option value="id" selected="selected">작성자</option>
									    <option value="content" >내용</option>
									</select>
								</c:when>
								<c:when test="${searchField == 'content'}">
									<select name="searchField" class="form-control">
									    <option value="title">제목</option>
									    <option value="id" >작성자</option>
									    <option value="content" selected="selected">내용</option>
									</select>
								</c:when>
								<c:otherwise>
									<select name="searchField" class="form-control">
									    <option value="title">제목</option>
									    <option value="id">작성자</option>
									    <option value="content">내용</option>
									</select>
								</c:otherwise>
							</c:choose>
							<!-- <select name="searchField" class="form-control">
							    <option value="title">제목</option>
							    <option value="id">작성자</option>
							    <option value="content" >내용</option>
							</select> -->
							<input class="form-control" type="search" placeholder="Search" aria-label="Search" name="searchWord" value="${searchWord }">
							<button class="btn btn-outline-primary" type="button" onclick="movePage(1);"><i class="bi bi-search" style='font-size:20px'></i></button>
						</div>
					</form>  
		         </div>
		         
		         <div class="row mt-3 mx-1 mx-auto">
		             <!-- 게시판리스트부분 -->
		             <table class="table table-bordered table-hover table-striped">
		                 <colgroup>
		                     <col width="40px" />
		                     <col width="350px" />
		                     <col width="80px" />
		                     <col width="80px" />
		                     <col width="50px" />
		                     <col width="50px" />
		                     <col width="30px" />		                    
		                 </colgroup>
		                 <thead>
		                     <tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
		                         <th>번호</th>
		                         <th>제목</th>
		                         <th>작성자</th>
		                         <th>작성일</th>
		                         <th>상태</th> 		                         
		                         <th>조회수</th>
		                         <th>첨부</th> 		                         
		                     </tr>
		                 </thead>
		                 <tbody>
		                 	<c:choose>
		                 		<c:when test="${ empty list }">  
							        <tr>
							            <td colspan="6" align="center">
							                등록된 게시물이 없습니다^^*
							            </td>
							        </tr>
							    </c:when>
			                 	<c:otherwise> 
				                    <c:forEach items="${list}" var="dto" varStatus="loop">
										<tr align="center">
											<td>${totalCount - (((pageNum-1) * pageSize) + loop.index)}</td>
						    		 		<c:choose>
										        <c:when test="${ dto.parentIdx eq 0}">
										        	<td align="left">
										        		<i class="bi bi-lock-fill"></i> 
		      												<sec:authorize access="isAnonymous()"> <!-- 로그인 안 되어 있을때 -->
		      													<a href="javascript:boardPassPop();">${dto.title}</a>
		      												</sec:authorize>
															<sec:authorize access="!isAnonymous() and  hasRole('ADMIN')"> <!-- 로그인 되어있을때 -->
																<a href="../member/inquiryBoardview?idx=${dto.idx }">${dto.title}</a>
															</sec:authorize>
															<sec:authorize access="!isAnonymous() and hasRole('USER')"> <!-- 로그인 되어있을때 -->
																<c:if test="${ dto.id == Id }">
																	<a href="../member/inquiryBoardPass?idx=${dto.idx }">${dto.title}</a>
																</c:if>
																<c:if test="${ dto.id != Id }">
					 												<a href="javascript:boardPassPop2();">${dto.title}</a>
		      													</c:if> 
															</sec:authorize>
	      												
      													<c:if test="${dto.postDate == today}"><span class="badge rounded-pill bg-danger">new</span></c:if>
      												</td>
										        </c:when>
										        <c:otherwise>
										        	<td align="left" style="color:red; font-weight:bold;">&nbsp; &nbsp; &nbsp; &nbsp; <i class="bi bi-arrow-return-right"></i>
										        	<sec:authorize access="isAnonymous()"><!--  로그인 안했을때 -->
       													<a href="javascript:boardPassPop();"> ${dto.title}</a>
       												</sec:authorize>
       												<sec:authorize access="!isAnonymous() and  hasRole('ADMIN')">
       													<a href="../member/inquiryBoardview?idx=${dto.idx}"> ${dto.title}</a>
       												</sec:authorize>
       												<sec:authorize access="!isAnonymous() and  hasRole('USER')">
       													<c:if test="${ dto.parentId == Id }">
       														<%-- <a href="../member/inquiryBoardview?idx=${dto.idx}"> ${dto.title}</a> --%>
       														<a href="../member/inquiryBoardPass?idx=${dto.idx }">${dto.title}</a>
       													</c:if>
       													<c:if test="${ dto.parentId != Id }">
       														<a href="javascript:boardPassPop2();">${dto.title}</a>
       													</c:if>
       												</sec:authorize>
       												</td>
										        </c:otherwise>
										    </c:choose>  
										    
										    
											<td>${dto.id}</td>
											<td>${dto.postDate}</td>
											<td>
												<c:choose>
											        <c:when test="${dto.parentIdx eq 0 }">
											        	<c:if test="${dto.responses > 0 }">
								                    		답변 완료
								                    	</c:if>
								                    	<c:if test="${dto.responses eq 0 }">
								                    		답변 대기
								                    	</c:if>
											        </c:when>
											        <c:otherwise>
											        	
											        </c:otherwise>
											    </c:choose> 
											</td>
											<td>${dto.viewCount}</td>
											<c:choose>
										        <c:when test="${ not empty dto.ofile }">
													<td><a href="../member/inquiryBoardview?idx=${dto.idx}"><i class="bi bi-file-earmark-arrow-down"></i></a></td>
										        </c:when>
										        <c:otherwise>
										        	<td></td>
										        </c:otherwise>
										    </c:choose>											        									
										<tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
		                 </tbody>
		             </table>
		         </div>
		         
		         
		         
		   		<div>
	               <div class="col d-flex justify-content-end">
	               	   <button type="button" class="btn btn-outline-primary mx-1" onclick="location.href='../guest/inquiryBoard';">리스트보기</button>
	                   <button type="button" class="btn btn-primary" onclick="location.href='../member/inquiryBoardWriteForm';">글쓰기</button>
	               </div>
	           </div>
		   
				<!-- 페이징 부분 -->
		         <div class="row mt-3">
		             <div class="col">
		                  <ul class="pagination justify-content-center">
		                      <!-- <li class="page-item disabled">
		                          <a href="#" class="page-link">&laquo;</a>
		                      </li>
		                      <li class="page-item">
		                          <a href="#" class="page-link">&lt;</a>
		                      </li>	 -->
		                       ${ pagingImg }
		                      <!-- <li class="page-item"><a href="#" class="page-link">1</a></li>
		                      <li class="page-item"><a href="#" class="page-link">2</a></li>
		                      <li class="page-item"><a href="#" class="page-link">3</a></li>
		                      <li class="page-item"><a href="#" class="page-link">4</a></li>
		                      <li class="page-item"><a href="#" class="page-link">5</a></li> -->
		                      
		                      <!-- <li class="page-item">
		                          <a href="#" class="page-link">&gt;</a>
		                      </li>
		                      <li class="page-item">
		                          <a href="#" class="page-link">&raquo;</a>
		                      </li> -->
		                  </ul>
				   	</div>
		          </div> <!-- 페이징 끝  -->
		          
		          
		          
		      </div>
		</main>	 
			 	
		<footer class="container">
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
	  	</footer>		
			
		</body>
	</html>
