<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<html>
	<head>
	<title>채팅 상담</title>
	
		<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	    
	   <!--  <script type="text/javascript">
		    function openChatRoom(url) {
	            window.open(url, 'chatWindow', 'width=500,height=500,scrollbars=yes,resizable=yes');
	            return false; 
	        }
	    </script> -->
	    
	    <script type="module">
import { initializeApp } from 'https://www.gstatic.com/firebasejs/10.12.4/firebase-app.js'
import { getDatabase, ref, onValue, set, child, push, onChildAdded, query, limitToLast } 
	from 'https://www.gstatic.com/firebasejs/10.12.4/firebase-database.js'

const firebaseConfig = {
  apiKey: "AIzaSyCFicUJR5ltjGYdnbIxJJyrDg_SpXbf9GM",
  authDomain: "springbootstudy-ea537.firebaseapp.com",
  databaseURL: "https://springbootstudy-ea537-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "springbootstudy-ea537",
  storageBucket: "springbootstudy-ea537.appspot.com",
  messagingSenderId: "519354041411",
  appId: "1:519354041411:web:3e46f2f4fd871be6e6c0f6"
};
	
var app = initializeApp(firebaseConfig);
var db = getDatabase(app);

	 document.addEventListener('DOMContentLoaded', () => {
            const chatRoomListElement = document.getElementById('chatRoomList');
            if (!chatRoomListElement) {
                console.error("Chat room list element not found!");
                return;
            }

            function updateChatRoomList() {
                const chatRoomsRef = ref(db, 'messages/chatRooms/');

                onValue(chatRoomsRef, (snapshot) => {
                    chatRoomListElement.innerHTML = '';
                    snapshot.forEach((chatRoomSnapshot) => {
                        const chatRoomId = chatRoomSnapshot.key;
                        let unreadCount = 0;

                        chatRoomSnapshot.forEach((messageSnapshot) => {
                            const messageData = messageSnapshot.val();
                            const unreadStatus = messageData.unreadStatus;

                            if (unreadStatus && unreadStatus.admin) {
                                unreadCount++;
                            }
                        });

                        const listItem = document.createElement('li');
                        listItem.className = 'list-group-item position-relative';
                        listItem.innerHTML = `
                            <a href="/member/chatRoom?chatRoomId=${chatRoomId}" onclick="return openChatRoom(this.href);">
                                Chat Room: ${chatRoomId}
                                <span id="notification-${chatRoomId}" class="notification-badge">${unreadCount > 0 ? unreadCount : ''}</span>
                            </a>
                        `;
                        chatRoomListElement.appendChild(listItem);
                    });
                });
            }
	}
</script>
	    
		<style type="text/css">
		 /* link - 아직 클릭하지 않은 경우 */
		 a:link { color: black; text-decoration: none;}	
		 /* visited - 한번 클릭하거나 전에 클릭한적 있을 경우 */
		 a:visited { color: black; text-decoration: none;}	
		 /* hover - 마우스를 해당 링크에 위치했을 경우*/
		 a:hover { color: blue; text-decoration: underline;}
		</style>
	
	</head>

	<body> 
	    <div class="container">
	        <h2>채팅 상담 리스트</h2>
		        <ul class="list-group" id="chatRoomList">
		            <%-- <c:if test="${not empty chatRooms}">
		                <c:forEach var="chatRoomId" items="${chatRooms}">
		                    <li class="list-group-item">
		                        <a href="/member/chatRoom?chatRoomId=${chatRoomId}" onclick="return openChatRoom(this.href);">Chat Room: ${chatRoomId}</a>
		                    </li>
		                </c:forEach>
		            </c:if>
		            <c:if test="${empty chatRooms}">
		                <li class="list-group-item">채팅방 리스트가 존재하지 않습니다.</li>
		            </c:if> --%>
		        </ul>
	    </div>
	</body>	

 
 