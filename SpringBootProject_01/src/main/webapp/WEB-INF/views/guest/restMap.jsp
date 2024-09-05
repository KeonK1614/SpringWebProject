<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!doctype html>
	<html lang="en" data-bs-theme="auto">
	<head>	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f7f9ab0116bd62797e2fbd361dac3a9&libraries=services,clusterer,drawing"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	    <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
		<meta name="generator" content="Hugo 0.122.0">
		<title>화장실 지도</title>
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
		
		body { margin-top: 30px; } /* nav의 높이만큼 padding-top 추가 */
        
        /* 모달창 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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
			<div class="row">
				<div class="col-12 text-center">
					 <button id="currentLocationBtn" class="btn btn-danger btn-sm" onclick="Mylocation()">현재위치</button>
					 &nbsp;&nbsp;
					 <button  class="btn btn-primary btn-sm" onclick="location.href='eleMap';">엘레베이터지도</button>
					 &nbsp;&nbsp;
				</div>
			</div>
			<div class="row">
				<div class="map-container">	
			        <div id="map" style="width:100%;height:500px;"></div>
				</div>
			</div>
			<!-- 모달창 -->
		    <div id="myModal" class="modal">
		        <div class="modal-content">
		            <span class="close">&times;</span>
		            <p id="modalContent">모달 내용</p>
		        </div>
		    </div>
		    
		  
		   <script>
				var map;
				var markers = []; // 현재 지도에 표시된 마커들을 저장할 배열
				
				function initMap() {
				    var mapContainer = document.getElementById('map'),
				        mapOption = {
				            center: new kakao.maps.LatLng(37.554674785645716, 126.9706120117342),
				            level: 2
				        };

				    map = new kakao.maps.Map(mapContainer, mapOption);

				    var mapTypeControl = new kakao.maps.MapTypeControl();
				    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				    var zoomControl = new kakao.maps.ZoomControl();
				    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

					 // 지도를 클릭했을 때
				    /* kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
				        var latlng = mouseEvent.latLng;
				        map.setCenter(latlng);

				        var center = map.getCenter();
				        addressAdd(center.getLat(), center.getLng());
				    });  */
				    kakao.maps.event.addListener(map, 'idle', function() {
				        var center = map.getCenter();
				        console.log("지도 이동 후 중심 좌표: ", center.getLat(), center.getLng());

				        // 원하는 함수 호출 (예: 주소 추가)
				        addressAdd(center.getLat(), center.getLng());
				    });
				}
				
		        function addressAdd(centerX1, centerY1) {
		            $.ajax({
		                url: "/guest/restMap4",
		                type: "post",
		                data: {
		                    centerX: centerY1,
		                    centerY: centerX1
		                },
		                dataType: "json",
		                success: function (response) {
		                    console.log("성공");
		                    console.log(response);  // 응답 데이터를 출력합니다.
		                    removeMarkers();
		                    addMarkers(response);
		                },
		                error: function () {
		                    console.log("오류");
		                }
		            });
		        }
		        
		        function removeMarkers() {
		        	markers.forEach(marker => marker.setMap(null));
		        	markers = []; // 마커 배열 초기화
		        }
		        
	            function addMarkers(data) {
	                data.forEach(function(item) {
	                    // 마커의 컨텐츠를 정의합니다.
	                    var content = "<ul>" +
	                        "<li>장소명   : " + item.pname + "</li>" +
	                        "<li>주소     : " + item.addr1 + " " + item.addr2 + "</li>" +
	                        "<li>운영시간 : " + decodeURIComponent(item.optime) + "</li>" +
	                        "<li>전화번호 : " + item.phonenum + "</li>" +
	                        "<li>장소유형 : " + item.ptype + "</li>" +
	                        "<li>건물유형 : " + item.btype + "</li>" +
	                        "<li>상세정보 : " + item.detail1 + " " + item.detail2 + "</li>" +
	                        "</ul>";

	                    // 마커의 위치를 정의합니다.
	                    var position = new kakao.maps.LatLng(item.y_wgs84, item.x_wgs84);

	                    // 마커를 생성합니다.
	                    var marker = new kakao.maps.Marker({
	                        position: position
	                    });

	                    // 마커를 지도에 추가합니다.
	                    marker.setMap(map);
						
	                    kakao.maps.event.addListener(marker, 'click', function() {
	                    	document.getElementById('myModal').style.display = 'block';
				            document.getElementById('modalContent').innerHTML = content;
	                    });
	                    
	                    // 마커를 배열에 추가합니다.
	                    markers.push(marker);
	                });
	            }
	            
	        // 모달창 닫기 기능
	        const modal = document.getElementById('myModal');
	        const closeBtn = document.getElementsByClassName('close')[0];

	        closeBtn.onclick = function() {
	            modal.style.display = 'none';
	        };

	        window.onclick = function(event) {
	            if (event.target === modal) {
	                modal.style.display = 'none';
	            }
	        };
		            
	        // 현재 위치로 이동하는 함수
			function Mylocation() {
			    if (navigator.geolocation) {
			        navigator.geolocation.getCurrentPosition(function(position) {
			            var lat = position.coords.latitude;
			            var lon = position.coords.longitude;
			            
			            var locPosition = new kakao.maps.LatLng(lat, lon);
			            
			            // 지도의 중심좌표를 현재 위치로 변경합니다
			            map.setCenter(locPosition);
			            
			            // 현재 위치에 마커를 추가합니다
			            var marker = new kakao.maps.Marker({
			                map: map,
			                position: locPosition
			            });
			            
			            var message = '<div style="width:150px;text-align:center;padding:6px 0;">현재위치</div>';
			            var infowindow = new kakao.maps.InfoWindow({
			                content: message
			            });
			            infowindow.open(map, marker);
			            
			        }, function(error) {
			        });
			    } else {
			        alert("현재위치를 찾을 수 없습니다.");
			    }
			}
	        
			window.onload = initMap;
		</script>

		</main>	
		<hr/> 	
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


	

