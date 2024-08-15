<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	    <meta name="generator" content="Hugo 0.122.0">
	    <title>Carousel Template · Bootstrap v5.3</title>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
		<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>BoardList.html</title>
    <style>
        .title{
            text-align: left;
        }
        .nav-link{
            color: black;        
        }
        .nav-link:hover{
            color: #74890A;        
        }
         .nav-item > .active {
            color: white !important;
            background-color: rgb(145, 158, 126) !important;   
        }
    </style>

    <script>
        function register(){
            window.open("./MemberRegistSkin.html","registersite", "width=500px")
        }
    </script>
</head>
<body>
    <div class="row m-2">
        <nav class="navbar navbar-expand-lg  bg-success-subtle rounded" >
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="./images/logo.png" alt="Avatar Logo" style="width:130px;"> 
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                         <ul class="nav nav-pills me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" data-bs-toggle="pill" href="#CommunityBoard">자유게시판</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="pill" href="#DataBoard">자료실</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="pill" href="#GuestBook">방명록</a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                개발
                                </a>
                                <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">JAVA</a></li>
                                <li><a class="dropdown-item" href="#">HTML/CSS</a></li>
                                <li><a class="dropdown-item" href="#">SubMenu1</a></li>
                                <li><a class="dropdown-item" href="#">SubMenu2</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="https://getbootstrap.com/" target="_blank">bootstrap</a></li>
                                </ul>
                            </li>

                            <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i></button>
                            </form>

                        </ul>
                       
                        <ul class="nav nav-pills justify-content-end">
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="pill" onclick="register()" target='_blank'>
                                    <i class="bi bi-person-fill-add"></i>
                                    회원가입
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="pill" href="#">
                                    <i class="bi bi-person-fill-gear"></i>
                                    회원정보수정
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="pill" href="#">
                                    <i class="bi bi-box-arrow-in-right"></i>
                                    로그인
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="pill" href="#">
                                    <i class="bi bi-box-arrow-left"></i>
                                    로그아웃
                                </a>
                            </li>
                        </ul>                        
                    </div>
            </div>
        </nav>
    </div>

    <div class="container-fluid">        
        <div class="row">
            <div class="col m-auto">
                <div class="tab-content">
                    <div class="tab-pane container active" id="CommunityBoard">
                    	<h4>공지 게시판</h4> <br/>                      
                        <table class="table table-hover table-striped table-bordered text-center">
                            <colgroup>
                                <col width="5%" />
                                <col width="50%" />
                                <col width="15%" />
                                <col width="15%" />
                                <col width="10%" />
                                <col width="5%" />
                              </colgroup>
                            <thead class="table-success text-center">
                                <tr>
                                    <th>No</th>
                                    <th>Title</th>
                                    <th>Name</th>
                                    <th>Date</th>
                                    <th>views</th>
                                    <th>attachment</th>                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>100</td>
                                    <td class="title"><a href="#">화이트 럼과 블루 큐라소의 하와이를 재현</a>
                                        <span class="badge bg-danger">new</span>
                                    </td>
                                    <td>블루 하와이</td>
                                    <td>2024-06-30</td>
                                    <td>175</td>
                                    <td><i class="bi bi-file-earmark-image"></i></td>
                                </tr>
                                <tr>
                                    <td>100</td>
                                    <td class="title"><a href="#">화이트 럼과 블루 큐라소의 하와이를 재현</a>
                                        <span class="badge bg-danger">new</span>
                                    </td>
                                    <td>블루 하와이</td>
                                    <td>2024-06-30</td>
                                    <td>175</td>
                                    <td><i class="bi bi-file-earmark-image"></i></td>
                                </tr>
                                <tr>
                                    <td>100</td>
                                    <td class="title"><a href="#">화이트 럼과 블루 큐라소의 하와이를 재현</a>
                                        <span class="badge bg-danger">new</span>
                                    </td>
                                    <td>블루 하와이</td>
                                    <td>2024-06-30</td>
                                    <td>175</td>
                                    <td><i class="bi bi-file-earmark-image"></i></td>
                                </tr>
                                <tr>
                                    <td>100</td>
                                    <td class="title"><a href="#">화이트 럼과 블루 큐라소의 하와이를 재현</a>
                                        <span class="badge bg-danger">new</span>
                                    </td>
                                    <td>블루 하와이</td>
                                    <td>2024-06-30</td>
                                    <td>175</td>
                                    <td><i class="bi bi-file-earmark-image"></i></td>
                                </tr>
                                <tr>
                                    <td>100</td>
                                    <td class="title"><a href="#">화이트 럼과 블루 큐라소의 하와이를 재현</a>
                                        <span class="badge bg-danger">new</span>
                                    </td>
                                    <td>블루 하와이</td>
                                    <td>2024-06-30</td>
                                    <td>175</td>
                                    <td><i class="bi bi-file-earmark-image"></i></td>
                                </tr>
                                <tr>
                                    <td>99</td>
                                    <td class="title"><a href="#">데킬라를 베이스로 새콤한 맛의 칵테일</a>
                                        <span class="badge rounded-pill bg-success">댓글:80</span>
                                    </td>
                                    <td>마가리타</td>
                                    <td>2024-06-27</td>
                                    <td>200</td>
                                    <td><i class="bi bi-bookmark-check"></i></td>
                                </tr>
                                <tr>
                                    <td>98</td>
                                    <td class="title"><a href="#">진한 코코넛 향과 파인애플 주스!</a></td>
                                    <td>피나콜라다</td>
                                    <td>2024-06-12</td>
                                    <td>256</td>
                                    <td><i class="bi bi-file-earmark-image"></i></td>
                                </tr>
                                <tr>
                                    <td>97</td>
                                    <td class="title"><a href="#">복숭아 향의 풍미와 적절한 시큼함</a></td>
                                    <td>피치 크러시</td>
                                    <td>2024-06-01</td>
                                    <td>407</td>
                                    <td><i class="bi bi-file-earmark-music"></i></td>
                                </tr>
                                <tr>
                                    <td>98</td>
                                    <td class="title"><a href="#">진한 코코넛 향과 파인애플 주스!</a></td>
                                    <td>피나콜라다</td>
                                    <td>2024-06-12</td>
                                    <td>256</td>
                                    <td><i class="bi bi-file-earmark-image"></i></td>
                                </tr>
                                <tr>
                                    <td>97</td>
                                    <td class="title"><a href="#">복숭아 향의 풍미와 적절한 시큼함</a></td>
                                    <td>피치 크러시</td>
                                    <td>2024-06-01</td>
                                    <td>407</td>
                                    <td><i class="bi bi-file-earmark-music"></i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane container fade" id="DataBoard">여기는 자료실 입니다.</div>
                    <div class="tab-pane container fade" id="GuestBook">여기는 방명록입니다.</div>
                  </div>

                    <div class="d-flex flex-row-reverse">
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-primary">리스트보기</button>
                            <button type="button" class="btn btn-outline-primary">전송하기</button>
                            <button type="button" class="btn btn-outline-primary">Reset</button>
                         </div>
                         &nbsp;
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-warning">글쓰기</button>
                            <button type="button" class="btn btn-outline-warning">수정하기</button>
                            <button type="button" class="btn btn-outline-warning">삭제하기</button>
                            <button type="button" class="btn btn-outline-warning">답글쓰기</button>
                          </div>
                    </div>

                    <br/>

                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </div>
            </div>
         </div>
         
         <div class="row m-2 me-auto mb-2 mb-lg-0">
            <hr/>
            <div class="col-sm-2">   
                <h4>장다빈™</h4>
            </div>   

            <div class="col">   
                <p class="text-center">Center aligned text on all viewport sizes.
                Email: dk9ahs@gmail.com Mobile: 010-1234-5678 Address: 서울시 금천구 가산동 426-5 월드메르디앙2차 1강의실 
                <br/>copyright &amp; 2019 한국소프트웨어인재개발원. All right reserved.
                </p>
            </div> 
        </div>
