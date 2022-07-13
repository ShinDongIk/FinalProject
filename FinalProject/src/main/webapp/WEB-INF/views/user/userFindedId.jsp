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

<link rel="stylesheet" href="./resources/css/userFindedStyle.css">

</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    
    <div class="outer">
        <br>
        <div class="content1">
            <span class="subTitle">
                <b class="font-purple">아이디 </b><b>조회 결과</b>
            </span>
            <hr>
        </div>
        <div class="content2">
            <div class="contentTitle" id="content">
            	${ userInfo }
                ${ userInfo.userName }님의 아이디는 <b>${ userInfo.userId }</b>입니다.
            </div>
            <br><br><br>
            <button type="submit" class="btn button-gray">닫기</button> <br><br>
        </div>
    </div>

</body>
</html>