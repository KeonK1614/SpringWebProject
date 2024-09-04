<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
	<html lang="en" data-bs-theme="auto">
	<head>	 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
		<meta name="generator" content="Hugo 0.122.0">
		<title>Carousel Template · Bootstrap v5.3</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
		
		<style>
	        .content-edit {
	            display: none;
	            width: 100%; /* 너비를 조절합니다. 필요에 따라 조정하세요. */
			    height: 50px; /* 높이를 조절합니다. 필요에 따라 조정하세요. */
			    resize: vertical; /* 사용자가 세로 방향으로 크기를 조절할 수 있도록 합니다. */
	        }
	        .btn-edit, .btn-save {
	            margin-right: 5px;
	        }
	        .table-header {
            text-align: center;
            font-weight: bold;
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
			          <li><a class="dropdown-item" href="../guest/inquiryBoard">문의게시판</a></li>
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
		     <h4><strong>&nbsp;&nbsp;공지사항 게시판</strong> - <small>내용보기</small></h4>
		         
			  <div class="row mt-3 mx-1 mx-auto">
		         <form enctype="multipart/form-data" action="write" method="post" name="writeFrm">
	                <table class="table table-bordered">
		                <colgroup>
		                    <col width="20%"/>
		                    <col width="30%"/>
							<col width="20%"/>
							<col width="*"/>
		                </colgroup>
		                <tbody>
		                	<tr>
		                        <th class="text-center" style="vertical-align:middle;">제목</th>
		                        <td>${dto.title}</td>
		                        <th class="text-center" style="vertical-align:middle;">글번호</th>
		                        <td align="center">${dto.idx}</td>
		                    </tr>
		                	<tr>
		                        <th class="text-center" style="vertical-align:middle;">작성자</th>
		                        <td align="center">${dto.id}</td>
		                        <th class="text-center" style="vertical-align:middle;">작성일</th>
		                        <td align="center">${dto.postdate}</td>
		                    </tr>
		                    <tr>
		                    	<th class="text-center" style="vertical-align:middle;">조회수</th>
		                    	<td align="center">${dto.viewCount}</td>
		                    	<th class="text-center" style="vertical-align:middle;">추천</th>
		                    	<td align="center">${dto.likeCount}</td>
		                    </tr>
		                    <tr style="height: 300px">
		                        <th class="text-center" style="vertical-align:middle;">내용</th>
		                        <td colspan="3">
		                        	<c:if test="${ not empty dto.ofile and isImage eq true }">
		                        		<br/>
		                        		<img src="/static/files/${dto.sfile}" style="max-width: 100%;" />
		                        		<br/>
		                        	</c:if>
		                        	${dto.content}
		                        </td>
		                    </tr>
		                    <tr>
		                        <th class="text-center" style="vertical-align:middle;">첨부파일</th>
		                        <td colspan="3">
		                            <c:if test="${ not empty dto.ofile }">
		                            	${dto.ofile}
		                            </c:if>
		                        </td>
		                    </tr>
		                </tbody>
	                </table>
	                
	                <!-- 게스트 일 때 -->
	                <sec:authorize access="isAnonymous()">
	                	<div class="row">
		                    <div class="col text-right mb-4 d-flex justify-content-end">
		                        <button type="button" class="btn btn-outline-primary mx-1" onclick="location.href='noticeBoard';">리스트보기</button>
		                        <button type="button" class="btn btn-outline-primary mx-1" onclick="location.href='../guest/noticeLike?idx=${dto.idx}';">추천</button>
		                    </div>
	                	</div>
	                </sec:authorize>
	                <!-- 로그인 멤버 -->
                 	<sec:authorize access="hasRole('USER')">
                 		<div class="row">
		                    <div class="col text-right mb-4 d-flex justify-content-end">
		                        <button type="button" class="btn btn-outline-primary mx-1" onclick="location.href='noticeBoard';">리스트보기</button>
		                        <button type="button" class="btn btn-outline-primary mx-1" onclick="location.href='../guest/noticeLike?idx=${dto.idx}';">추천</button>
		                    </div>
	                	</div>
                 	</sec:authorize>
                 	<!-- 로그인 관리자 -->
	             	<sec:authorize access="hasRole('ADMIN')">
	             		<div class="row">
		                    <div class="col text-right mb-4 d-flex justify-content-end">
		                        <button type="button" class="btn btn-outline-primary mx-1" onclick="location.href='noticeBoard';">리스트보기</button>
		                        <button type="button" class="btn btn-outline-primary mx-1" onclick="location.href='../guest/noticeLike?idx=${dto.idx}';">추천</button>
		                        <button type="button" class="btn btn-outline-primary mx-1" onclick="location.href='../admin/noticeEditorForm?idx=${dto.idx}';">수정하기</button>
	                        	<button type="button" class="btn btn-outline-primary mx-1" onclick="deletePost(${dto.idx});">글삭제</button>
		                    </div>
	                	</div>
	             	</sec:authorize>
	             </form>
		   	  </div>      
		  </div>
		  
		  <!-- 댓글 부분 -->
		  <div><h4><strong>&nbsp;댓글달기</strong></h4></div>
		  <div class="card">
            <form action="../member/noticeComment" name="commentFrm">
            <input type="hidden" value="${dto.idx}"  name="idx">
              <div class="card-body d-flex">
                  <textarea id="reply-content" class="form-control me-2" rows="1" name="content1"></textarea>
                  <button type="submit" id="btn-reply-save" class="btn btn-primary" >등록</button>
              </div>
            </form>
          </div>
                
        <table class="table caption-top">
        <colgroup>
            <col width="60px">
            <col width="200px">
            <col width="80px">
            <col width="100px">
        </colgroup>
          <thead>
            <tr>
              <td colspan="4" class="table-header">댓글</td>
            </tr>
            <tr>
              <td align="center" class="table-header">아이디</td>
              <td align="center" class="table-header">내용</td>
              <td align="center" class="table-header">작성일</td>
              <td align="center" class="table-header">비고</td>
            </tr>
          </thead>
          <tbody>
          	<c:choose>
          		<c:when test="${ empty list }">
          			<tr>
          				<td colspan="4" align="center">
          					등록된 댓글이 없습니다.
          				</td>
          			</tr>
          		</c:when>
          		<c:otherwise>
          			<c:forEach items="${list}" var="dto" varStatus="loop">
          				<tr>
          					<td align="center">${dto.id}</td>
          					<td align="center">
          						<span class="content-text">${dto.content}</span>
                            	<textarea class="content-edit">${dto.content}</textarea>
          					</td>
          					<td align="center">${dto.postdate}</td>
          					<td align="center">
          						<button type="button" id="editButton" onclick="comentEdit(this, '${dto.coidx}', '${dto.id}');" aria-label="Edit" class="btn btn-primary">수정</button>
				              	<button type="button" onclick="deleteCommentPost(${dto.coidx}, '${dto.id}');"  class="btn btn-primary">삭제</button>
							</td>
				        </tr>
          			</c:forEach>
          		</c:otherwise>
          	</c:choose>
          </tbody>
        </table>
        
        <script>
        	//로그인 되어 있는 아이디 들고 옴 
		    var currentUserId = '${loginId}';
		    
		    //게시글 삭제
			function deletePost(idx)
			{
			    var confirmed = confirm("게시글을 삭제하겠습니까?"); 
			    if (confirmed) 
			    {
			        var form = document.writeFrm;      
			        form.method = "post";  
					form.action = "../admin/noticeDelete?idx="+idx; 
			        form.submit();  
			    }
			}	
	    	
			//댓글삭제
			function deleteCommentPost(coidx, id)
			{
				if(currentUserId === id)
				{
					var del = confirm("댓글을 삭제하겠습니까?");
					if(del)
			    	window.location.href = "../member/noticeCommentDelete?coidx=" + coidx; 
		    	}
		    	else
		    	{
		    		alert("작성자만 삭제 가능합니다.");
		    	}
			}
			
			//댓글수정
			function comentEdit(button, coidx, id) 
			{
		        const row = button.closest('tr');
		        const contentText = row.querySelector('.content-text');
		        const contentEdit = row.querySelector('.content-edit');

		        if(currentUserId === id)
				{
					var del = confirm("수정하시겠습니까?");
					if(del){
						if (button.textContent === '수정') {
				            contentText.style.display = 'none';
				            contentEdit.style.display = 'block';
				            button.textContent = '수정 완료';
				            button.onclick = () => editorComplete(button, coidx, contentEdit.value);
				        } else {
				            contentText.style.display = 'block';
				            contentEdit.style.display = 'none';
				            button.textContent = '수정';
				            button.onclick = () => comentEdit(button, coidx);

				            const updatedContent = contentEdit.value;
				            editorComplete(button, coidx, updatedContent);
				        }
					}
		    	}
		    	else
		    	{
		    		alert("작성자만 수정 가능합니다.");
		    	}
		         
		    }
			
			//댓글수정완료서버보내기
		    function editorComplete(button, coidx, updatedContent) {
		        $.ajax({
		            type: "POST",
		            url: "/guest/noticeCommentEditor",
		            data:{
		            	coidx : coidx,
		                content : updatedContent
		            },
		            success: function(response) {
		                alert("댓글 수정이 완료되었습니다.");
		                window.location.reload();
		            },
		            error: function(error) {
		                alert("다시 시도하세요.");
		            }
		        });
		    }
		</script>
	</main>	 
			 	
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


