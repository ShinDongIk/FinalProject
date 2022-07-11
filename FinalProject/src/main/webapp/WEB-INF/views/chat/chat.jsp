<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatTap.css" />
</head>
<body>
  
	<div id="chat-circle" class="btn btn-raised" onClick="chatCircleClick('${ loginUser.userNickname }');">
        <div id="chat-overlay"></div>
		    <i id="chatIcon" class="material-icons">chat</i>
	</div>
  
  <div class="chat-box">
    <div class="chat-box-header">
      	채팅
      <span class="chat-box-toggle"><i class="material-icons">close</i></span>
      
     </div>
     <div class="tab">
      	<div style="display:inline-block; float: left;width:50%;">
      		<ul class="tabnav">
      			<li style="width:100%; height: 100%;"><a id="tab1">채팅목록</a></li>
      		</ul>
      	</div>
      	<div style="display:inline-block; float: left; width:50%;">
      		<ul class="tabnav">
      			<li style="width:100%; height: 100%;"><a id="tab2">채팅창</a></li>
      		</ul>
      	</div>
	    
  	</div><!--tab-->
     <div id="chatContent">
	    <div class="chat-box-body">
	      <div class="chat-box-overlay">   
	      </div>
	      <div id="chat-content-area" class="chat-logs">
	       
	      </div><!--chat-log -->
	    </div>
	    <div class="chat-input">      
	        <input type="text" id="chat-input" placeholder="보내실 메시지를 입력하세요!"/>
	      	<button class="chat-submit" id="chat-content-submit" onClick="contentSubClick('${ loginUser.userNickname }');"><i class="material-icons">send</i></button> 
	    </div>
	  </div>
	  <div id="chatRoom">
	      <div id="chat-room">
	       		<div class="chat-list">
	       			<span align="center">채팅중인 채팅방이 존재하지 않습니다!</span><br>
	       		</div>
	      </div>
	    </div>
	  </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/js/chat.js"></script>
<script src="${pageContext.request.contextPath}/js/chatTap.js"></script>
</body>
</html>