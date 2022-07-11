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

<link rel="stylesheet" href="./resources/css/userFindPwdStyle.css">

</head>
	<body>
	    <div class="outer">
	        <br>
	        <div class="content1">
	            <span class="subTitle">
	                <b class="font-purple">임시 비밀번호 </b><b>발송 완료!</b>
	            </span>
	            <hr>
	        </div>
	        <div class="content2">
	            <div class="contentTitle">
	                입력하신 메일주소 <b>user1@naver.com</b>로 <br>
	                임시 비밀번호가 발송 되었습니다.
	                ${findFwdUserId }
	                <input type="text" id="findFwdUserId2">
	            </div>
	            <br><br><br>
	            <button type="submit" class="btn button-gray" onclick="window.close()">닫기</button> <br><br>
	        </div>
	    </div>
	</body>
</html>