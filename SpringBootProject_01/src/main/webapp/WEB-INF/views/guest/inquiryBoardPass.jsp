<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript">
	function showPasswordPrompt(callback) {
	    // 모달 표시
	    var modal = document.getElementById('passwordModal');
	    modal.style.display = 'block';

	    // 확인 버튼 클릭 시
	    document.getElementById('submitPassword').onclick = function() {
	        var password = document.getElementById('passwordInput').value;
	        modal.style.display = 'none';
	        callback(password);  // 콜백 함수로 비밀번호 전달
			    };
			}
		
			// 사용 예시
			if ("${dto.id}" === "${Id}") {
			    showPasswordPrompt(function(enteredPassword) {
			        if ("${dto.boardPass}" === enteredPassword) {
			            alert("인증 되었습니다.");
			        } else {
			            alert("비밀번호가 틀렸습니다.");
			            window.location.href = "../guest/inquiryBoard";
			        }
			    });
			} else {
			    alert("비밀글 열람권한이 없습니다.");
			    window.location.href = "../guest/inquiryBoard";
		}
	
	</script>
	<body>
		<div id="passwordModal" style="display:none;">
		    <label for="passwordInput">비밀번호를 입력하세요:</label>
		    <input type="password" id="passwordInput" />
		    <button id="submitPassword">확인</button>
		</div>	
	</body>
</html>