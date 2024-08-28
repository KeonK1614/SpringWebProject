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
			#mapwrap{position:relative;overflow:hidden;}
			.category, .category *{margin:0;padding:0;color:#000;}   
			.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
			.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
			.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
			.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
			.category .ico_coffee {background-position:-10px 0;}  
			.category .ico_store {background-position:-10px -36px;}  
			
			body { margin-top: 60px; } /* nav의 높이만큼 padding-top 추가 */
		</style>
		
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
			<div id="mapwrap">
				<div id="map" style="width:600px;height:500px;"></div>
				
				<!-- 지도 위에 표시될 마커 카테고리 -->
			    <div class="category">
			        <ul>
			            <li id="restroomMenu" onclick="changeMarker('restroom')">
			                <span class="ico_comm ico_coffee"></span>
			                화장실
			            </li>
			            <li id="elevatorMenu" onclick="changeMarker('elevator')">
			                <span class="ico_comm ico_store"></span>
			                엘레베이터
			            </li>
			        </ul>
			    </div>
		    </div>
		    
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f7f9ab0116bd62797e2fbd361dac3a9&libraries=services,clusterer,drawing"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.554674785645716, 126.9706120117342), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨 
			    }; 
	
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
<!-- 			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();
	
				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
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
				            
				            var message = '<div style="padding:5px;">현재위치</div>';
				            var infowindow = new kakao.maps.InfoWindow({
				                content: message
				            });
				            infowindow.open(map, marker);
				            
				        }, function(error) {
				            console.error('Geolocation error:', error);
				        });
				    } else {
				        alert("Geolocation is not supported by this browser.");
				    }
				}
				
				var restroomPositions = [ 
				    /* new kakao.maps.LatLng(37.49931680941938, 126.88290031024228),
				    new kakao.maps.LatLng(37.47016019714292, 126.92940671580033),
				    new kakao.maps.LatLng(37.55926559152876, 127.08747012564345),
				    new kakao.maps.LatLng(37.539044611751656, 127.0976934608308) */
				    
					 <c:forEach var="item1" items="${restDataList}">
			            {
			            	new kakao.maps.LatLng(${item1.y_wgs84}, ${item1.x_wgs84})
			            }
			         <c:if test="${not empty restDataList}">,</c:if>
			        </c:forEach> 
				];
				
				var elevatorPositions = [
				    new kakao.maps.LatLng(37.56724821588269, 127.01210778871535),
				    new kakao.maps.LatLng(37.56520873883503, 126.98653135118927),
				    new kakao.maps.LatLng(37.496201943633714, 126.85017839065803),
				    new kakao.maps.LatLng(37.4808535380092, 126.88991850196187)
				];
				
				// 마커에 표시할 인포윈도우를 생성합니다 
				 var infowindows = []; // 인포윈도우를 저장할 배열
	            
	            // 마커 클러스터러를 생성합니다
	            var clusterer = new kakao.maps.MarkerClusterer({
	                map: map, // 마커 클러스터러가 포함될 지도 객체
	                averageCenter: true, // 마커들의 평균 위치를 클러스터링 할 때 중심으로 설정
	                minLevel: 10 // 클러스터 할 최소 지도 레벨
	            });

	            // 마커를 생성하고 클러스터러에 추가합니다
	            var markers = positions.map(function (position) {
	            	var marker = new kakao.maps.Marker({
	                    position: position.latlng
	                });
	            	
	                var infowindow = new kakao.maps.InfoWindow({
	                    content: position.content
	                });
	                
	                infowindows.push(infowindow);
	                
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    infowindows.forEach(function(iw) {
	                        iw.close(); // 모든 인포윈도우 닫기
	                    });
	                    infowindow.open(map, marker);
	                });
	                
	                return marker;
	            });

	            // 클러스터러에 마커를 추가합니다
	            clusterer.addMarkers(markers);
	            
	            kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

	                // 현재 지도 레벨에서 1레벨 확대한 레벨
	                var level = map.getLevel()-1;

	                // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	                map.setLevel(level, {anchor: cluster.getCenter()});
	            });
				
				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				    
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				} 
				
				
				
				var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
			    restroomMarkers = [], // 화장실 마커 객체를 가지고 있을 배열입니다
			    elevatorMarkers = []; // 엘레베이터 마커 객체를 가지고 있을 배열입니다
			    
			    createRestroomMarkers(); // 화장실 마커를 생성하고 화장실 마커 배열에 추가합니다
			    createElevatorMarkers(); // 엘레베이터 마커를 생성하고 엘레베이터 마커 배열에 추가합니다
			    
			    changeMarker('restroom'); // 지도에 화장실 마커가 보이도록 설정합니다
			    
			    // 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
			    function createMarkerImage(src, size, options) {
			        var markerImage = new kakao.maps.MarkerImage(src, size, options);
			        return markerImage;            
			    }
			    
			 	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
			    function createMarker(position, image) {
			        var marker = new kakao.maps.Marker({
			            position: position,
			            image: image
			        });
			        
			        return marker;  
			    } 
			 	
			 	// 화장실 마커를 생성하고 화장실 마커 배열에 추가하는 함수입니다
			    function createRestroomMarkers() {
			        
			        for (var i = 0; i < restroomPositions.length; i++) {  
			            
			            var imageSize = new kakao.maps.Size(22, 26),
			                imageOptions = {  
			                    spriteOrigin: new kakao.maps.Point(10, 0),    
			                    spriteSize: new kakao.maps.Size(36, 98)  
			                };     
			            
			            // 마커이미지와 마커를 생성합니다
			            var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
			                marker = createMarker(restroomPositions[i], markerImage);  
			            
			            // 생성된 마커를 화장실 마커 배열에 추가합니다
			            restroomMarkers.push(marker);
			        }     
			    }

			    // 화장실 마커들의 지도 표시 여부를 설정하는 함수입니다
			    function setRestroomMarkers(map) {        
			        for (var i = 0; i < restroomMarkers.length; i++) {  
			        	restroomMarkers[i].setMap(map);
			        }        
			    }

			    // 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
			    function createElevatorMarkers() {
			        for (var i = 0; i < elevatorPositions.length; i++) {
			            
			            var imageSize = new kakao.maps.Size(22, 26),
			                imageOptions = {   
			                    spriteOrigin: new kakao.maps.Point(10, 36),    
			                    spriteSize: new kakao.maps.Size(36, 98)  
			                };       
			         
			            // 마커이미지와 마커를 생성합니다
			            var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
			                marker = createMarker(elevatorPositions[i], markerImage);  

			            // 생성된 마커를 편의점 마커 배열에 추가합니다
			            elevatorMarkers.push(marker);    
			        }        
			    }

			    // 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
			    function setElevatorMarkers(map) {        
			        for (var i = 0; i < elevatorMarkers.length; i++) {  
			        	elevatorMarkers[i].setMap(map);
			        }        
			    }
			    
			 	// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
			    function changeMarker(type){
			        
			        var restroomMenu = document.getElementById('restroomMenu');
			        var elevatorMenu = document.getElementById('elevatorMenu');
								        
			        // 화장실 카테고리가 클릭됐을 때
			        if (type === 'restroom') {
			        
			            // 화장실 카테고리를 선택된 스타일로 변경하고
			            restroomMenu.className = 'menu_selected';
			            
			            // 편의점은 선택되지 않은 스타일로 바꿉니다
			            elevatorMenu.className = '';
			            
			            
			            // 화장실 마커들만 지도에 표시하도록 설정합니다
			            setRestroomMarkers(map);
			            setElevatorMarkers(null);
			            
			            
			        } else if (type === 'elevator') { // 엘레베이터 카테고리가 클릭됐을 때
			        
			            // 엘레베이터 카테고리를 선택된 스타일로 변경하고
			            restroomMenu.className = '';
			            elevatorMenu.className = 'menu_selected';
			            			            
			            // 엘레베이터 마커들만 지도에 표시하도록 설정합니다
			            setRestroomMarkers(null);
			            setElevatorMarkers(map);
			            
			            
			        }
			 	}
			 	
			 

			   
			</script> 
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


	

