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
  
	<div id="chat-circle" class="btn btn-raised">
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
	      <div class="chat-logs">
	       
	      </div><!--chat-log -->
	    </div>
	    <div class="chat-input">      
	      <form>
	        <input type="text" id="chat-input" placeholder="보내실 메시지를 입력하세요!"/>
	      	<button type="submit" class="chat-submit" id="chat-submit"><i class="material-icons">send</i></button>
	      </form>      
	    </div>
	  </div>
	  <div id="chatRoom">
	      <div id="chat-room">
	       		<div class="chat-list">
	       			<span>채팅 상대 : admin</span><br>
	       			<button id="exit-chat"><i class="material-icons">exit_to_app</i></button>
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