<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<html>
<head>
<title>채팅 상담</title>

	<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

	<style>
	#chatWindow{border:1px solid black; width:500px; height:500px; 
		overflow:scroll; padding:10px; border-radius: 10px; overflow-x:hidden}
		overflow:auto; padding:5px; border-radius: 30px; margin: 10px} */ 
	#chatMessage{width:236px; height:30px;}
	#sendBtn {position:relative; margin: 2px;}
	#closeBtn {position:relative;}
	
	#chatId{width:143px; height:24px; border:1px solid #AAAAAA; 
		background-color:#EEEEEE;}
	.myMsg{text-align:right;}
	.yourMsg{text-align:left;}
	.Msg{background-color:#B4E380; border-radius: 10px; margin: 2px; padding: 5px;}
	.sendMsg{background-color:#FFFBE6; border-radius: 10px; margin: 2px; padding: 5px;}
	.socket{background-color:#F6FB7A; border-radius: 10px; padding: 5px;}
	.socketdiv{text-align:center; margin: 10px;}
	.myId{text-align:right; margin: 4px;}
	.yourId{text-align:left; margin: 4px;}
	#messageArea{margin: 5px;}
	body{margin: 10px;}
	
	 .scroll::-webkit-scrollbar {
	    width: 15px;
	  }
	  .scroll::-webkit-scrollbar-thumb {
	    background-color: rgba(0, 0, 0, 0.7);
	    border-radius: 10px;
	  }
	  .scroll::-webkit-scrollbar-track {
	    background-color: rgba(0, 0, 0, 0.3);
	    border-radius: 10px;
	  }
	</style>
</head>

<body> 
	 <!-- 파라미터로 전달된 대화명을 얻어와서 사용 -->
    <input type="hidden" id="chatId" value="${param.chatId}"  />

    <!-- 채팅 내역이 출력되는 부분 -->
    <div id="chatWindow"  class="scroll bg-success p-2 text-dark bg-opacity-10"></div>
    <!-- 메세지를 입력하고 전송을 위한 버튼 -->
	 <div id="messageArea" class="position-relative" style="display: flex; align-items: center;">
        <input type="text" id="chatMessage" onkeyup="enterKey();" style="width: 350px;" class="form-control">
        <button id="sendBtn" onclick="sendMessage();" class="btn btn-outline-secondary btn-sm">전송</button>
        <button id="closeBtn" onclick="disconnect();" class="btn btn-outline-danger btn-sm">채팅 종료</button>
    </div>  
</body>
</html>
<script>
/*
	페이지가 로드되면 제일 먼저 웹소켓 객체를 생성한다. 이대 사용하는 주소는 
	웹소켓 설정 클래스에서 지정한 요청명을 사용해야한다. 
	localhost로 작성하면 내컴퓨터에서만 테스트할 수 있고, 내부아이피를 사용하면
	다른 사람이 내 컴퓨터에 접속할 수 있다. 
 */
var webSocket
//    = new WebSocket("ws://192.168.0.20:8081/myChatServer");
    = new WebSocket("ws://localhost:8081/myChatServer");

//채팅을 위한 전역변수 생성 
var chatWindow, chatMessage, chatId;

/*
	채팅창이 열리면 대화창, 메세지입력란, 대화명 표시란으로 사용할 DOM을 얻어와서
	저장한다. 
 */
window.onload = function() {
    chatWindow = document.getElementById("chatWindow");
    chatMessage = document.getElementById("chatMessage");
    chatId = document.getElementById('chatId').value;    
}

//입력된 메세지를 전송할 때 호출한다. 
function sendMessage() {
	if(chatMessage.value == null || chatMessage.value == ''){
		alert("빈칸은 전송이 불가합니다.");
	}
	else{
		//메세지를 대화창에 추가한다. 
		chatWindow.innerHTML += "<div class='myId'> " +chatId + "</div>";
		chatWindow.innerHTML += "<div class='myMsg'>" + 
	    							"<span class='Msg'>" + chatMessage.value + "</span>" +							
								"</div>"
		//웹소켓 서버로 메세지를 전송한다. 전송형식은 '채팅아이디|메세지'     							
	    /* webSocket.send(chatId + '|' + chatMessage.value); */
		if(chatId != 'admin'){
	   		webSocket.send(chatId + '|' + '/admin' +chatMessage.value);
		} else if(chatId == 'admin'){
		    webSocket.send(chatId + '|' + chatMessage.value);
		}
	    //다음 메세지를 즉시 입력할 수 있도록 비워준다. 
	    chatMessage.value = ""; 
	    //대화창의 스크롤을 항상 제일 아래로 내려준다. 
	    chatWindow.scrollTop = chatWindow.scrollHeight; 
	}
}

//웹소켓 서버에서 접속종료
function disconnect() {
    webSocket.close();
}

//메세지 입력후 엔터키를 누르면 즉시 메세지 전송 
function enterKey() {
	console.log("키 눌러짐");
	//keyCode를 통해 Enter키가 눌러지는것을 감지한다. 
    if (window.event.keyCode == 13) {  
        sendMessage();
    }
}

//웹소켓 서버에 연결되었을때 자동으로 호출
webSocket.onopen = function(event) {   
    chatWindow.innerHTML += "<div class='socketdiv'> <span class='socket'> 채팅 상담을 시작합니다.<br/> </span> </div>";
};

//웹소켓 서버가 종료되었을때 자동으로 호출 
webSocket.onclose = function(event) {
	var confirmed = confirm("채팅 상담을 종료하시겠습니까?");
	if (confirmed) {
	    chatWindow.innerHTML += "<div class='socketdiv'> <span class='socket'> 채팅 상담이 종료되었습니다.<br/> </span> </div>";
	}
};

//에러발생시 자동으로 호출 
webSocket.onerror = function(event) { 
    alert(event.data);
    chatWindow.innerHTML += "<div class='socketdiv'> <span class='socket'> 채팅 중 에러가 발생하였습니다.<br/> </span> </div>";
}; 

//웹소켓 서버가 메세지를 받았을때 자동으로 호출 
webSocket.onmessage = function(event) {
	//대화명과 메세지를 분리한다. 전송시 |(파이프)로 조립해서 보낸다. 
    var message = event.data.split("|");  
	//앞부분은 보낸 사람의 대화명
    var sender = message[0];
	//뒷부분은 메세지 내용 
    var content = message[1]; 
    if (content != "") {
        if (content.match("/")) { 
        	//메세지에 슬러쉬가 포함되어 있다면 명령어로 인식한다. 
            if (content.match(("/" + chatId))) {
            	/*
            	귓속말은 지정된 특정 사용자에게만 보여진다. 서버에서는 
            	모든 사용자에게 메세지를 Echo하지만 if문을 통해 한사람
            	에게만 디스플레이된다. 
          		*/
            	if (sender != 'admin'){
               		var temp = content.replace(("/" + chatId), 	"[문의] : ");
          		} else if (sender == 'admin'){
                	var temp = content.replace(("/" + chatId), 	"[답변] : ");
          		}
                chatWindow.innerHTML += "<div class='yourId'> " + sender + "</div>";
                chatWindow.innerHTML += "<div class='yourMsg'>" + 
											"<span class='sendMsg'>"  + temp + "</span>" +
										"</div>";
            }
        }
        else {  
        	//슬러쉬가 없다면 일반적인 메세지로 판단한다. 
            chatWindow.innerHTML += "<div class='yourId'> " + sender + "</div>";
            chatWindow.innerHTML += "<div class='yourMsg'>" + 
										"<span class='sendMsg'>"  + content + "</span>" +
									"</div>";
        }
    }
    
    //스크롤바를 제일 아래로 내려준다. 
    chatWindow.scrollTop = chatWindow.scrollHeight; 
};
</script>
