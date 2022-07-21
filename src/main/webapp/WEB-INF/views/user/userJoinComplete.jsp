<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="./resources/css/userJoinCompleteStyle.css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div class="outer">
        <br><br>
        <h3 style="font-size: 26px; letter-spacing: 0.15em">WELCOME TO ENJOY FOR OTT 😃</h3>
        <p>
            <b class="font-purple">${ loginUser.userName }</b>님의 가입을 진심으로 환영합니다.
        </p>
        <br><br>

        <div class="buttonArea">    
            <button type="button" class="btn button-purple" onclick="location.href='./'">메인으로</button>
        </div>
    </div>
</body>
</html>