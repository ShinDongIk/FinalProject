<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
c

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="./resources/css/partyJoinCompleteStyle.css">

</head>
<jsp:include page="../common/menubar.jsp"/>
<body>
    <div class="outer">
        <br><br>
        <h3 style="font-size: 26px; letter-spacing: 0.15em">JOIN COMPLETE 👾</h3>
        <p>
            파티에 참여 되었습니다! <br><br>
            아이디, 비밀번호는 마이페이지의 참여파티내역에서 확인 가능합니다.
        </p>
        <br><br>

        <div class="buttonArea">    
            <button type="button" class="btn button-purple" onclick="location.href='./mypage.me'">마이페이지 이동</button>
        </div>
    </div>
</body>
</html>