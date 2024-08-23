<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	    

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
		<script type="text/javascript">
			$(document).ready(function() {
	            $('#email').on('input', function() {
	                var email = $(this).val();
	                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;
	                if (emailRegex.test(email)) {
	                    $('#email-feedback').text('사용가능한 이메일입니다.').css('color', 'green');
	                } else {
	                    $('#email-feedback').text('이메일 형식이 맞는지 확인해주세요').css('color', 'red');
	                }
	            });
	        });
			
			function sendNumber(){
		        $("#mail_number").css("display","block");
		        $.ajax({
		            url:"/security/sendVerificationCode",
		            type:"post",
		            dataType:"json",
		            data:{"email" : $("#email").val()},
		            success: function(data){
		                alert("인증번호 발송");
		                $("#Confirm").val(data);
		            }, error: function(xhr, status, error) {
	                    alert("메일 발송에 실패했습니다. 다시 시도해주세요.");
	                }
		        });
		    }
			 
			function confirmNumber(){
			    var number1 = $("#number").val();
			    var number2 = $("#Confirm").val();

			    if(number1 == number2){
	                var name = $("#name").val();
	                var email = $("#email").val();

	                $.ajax({
	                    url: '/security/findId',
	                    method: 'POST',
	                    data: { name: name, email: email },
	                    success: function(data) {
	                        if (data.id) {
	                            $("#user-id-value").text(data.id);
	                            $("#user-id").slideDown();
	                        } else {
	                            alert("해당 정보로 찾을 수 없습니다.");
	                            $("#user-id").slideUp();
	                        }
	                    },
	                    error: function() {
	                        alert("서버와의 통신에 문제가 발생했습니다.");
	                    }
	                });
	            } else {
	                alert("인증번호가 다릅니다.");
	            }
			}
		</script>
	    
	    <!-- Custom styles for this template -->
	    <link href="../carousel/carousel.css" rel="stylesheet">
	    <link href="../carousel/sign-in.css" rel="stylesheet">
	  </head>
	<body>
		<main class="form-signin w-100 m-auto">
		<form action="/security/findIdMail" method="post" name="finidform" id="find-id-form">
	    <img class="mx-auto d-block mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal text-center">아이디찾기</h1>
	    <div class="form-floating">
		    <input type="text" name="name"class="form-control" id="name" placeholder="email을 입력하세요" required >
		    <label for="floatingInput">이름</label>
		    <span id="email-feedback"></span>
			<div class="invalid-feedback">
				이름을 입력해주세요.
			</div>      
	    </div>
	    <div class="form-floating">
		    <input type="email" name="eamil"class="form-control" id="email" placeholder="email을 입력하세요" required >
		    <label for="floatingInput">이메일</label>
		    <span id="email-feedback"></span>
			<div class="invalid-feedback">
				이메일을 입력해주세요.
			</div>
			<button type="button" onclick="sendNumber()">인증번호 발송</button>     
	    </div>
	    <div id="mail_number" name="mail_number" style="display: none">
            <input type="text" name="number" id="number" style="width:250px; margin-top: -10px" placeholder="인증번호 입력">
            <input type="hidden" name="Confirm" id="Confirm" style="width:250px; margin-top: -10px" placeholder="인증번호 입력">
            <button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
	    </div>

		<div id="user-id">
       		 아이디: <span id="user-id-value"></span>
		</div>
	    <button class="btn text-white w-100 my-2"style="background-color: #009E73;" id="submit" type="submit">아이디 찾기</button>
	  </form>
	  
	  <hr class="featurette-divider">
	  
	   <footer class="container">
	    <p class="float-end"><i class="bi bi-arrow-up-circle"></i><a href="#">Back to top</a></p>
	    <p>&copy; 2017–2024 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
	  </footer>
	</main>
	
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>