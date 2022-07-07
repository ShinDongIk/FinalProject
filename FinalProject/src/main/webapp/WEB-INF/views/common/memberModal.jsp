<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modal</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/memberModal.css"/>
</head>
<body>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>회원정보</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
                <p>회원 아이디 : admin</p>
                <p>회원 등급 : 골드</p>
            </div>
            <div class="content">
                <button id="dec-btn" class="md-button1-color">신고하기</button>
                <button class="md-button2-color">채팅하기</button>
            </div>
            <br>
            <div class="declaration">
	            <form action="" onsubmit="return false;" method="post">
	            	<ul style="padding-left: 0px">
	            		<li class="ul-padding"><p>신고 아이디 : admin</p></li>
	            		<li class="ul-padding"><p>신고 내용</p></li>
	            		<li class="ul-padding">
	            			<textarea id="dec-textarea" rows="10" cols="45"></textarea>
	            		</li>
	            		<li style="text-align: center;">
	            			<button id="dec-close" class="md-button1-color">닫기</button>
	            			<button type="submit" class="md-button2-color">신고접수</button>
	            		</li>
	            	</ul>
	            </form>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/memberModal.js"></script>
    </div>
</body>
</html>