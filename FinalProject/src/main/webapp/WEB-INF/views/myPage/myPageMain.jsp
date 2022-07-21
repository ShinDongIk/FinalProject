<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .outer{
        
        
    }
    .mpmain{
        background: #A8B0FF;
        width: 120px;
        height: 150px;
        margin-right: 50px;
        display: inline-block;
        
        
    }
    .display-test{
        border: 1px solid black;
        width: 150px;
        height: 150px;
    }
    #like{
        margin-top: 25px;
    
    }
    #partylist{
        margin-top: 25px;
    }
    #writechk{
        margin-top: 25px;
    }
    #infomodi{
        margin-top: 25px;
    }
    
   #meminfo{
        border: 1px solid black;
        width: 40%;
        height: 200px; 
        text-align: left;
        float: left;
        margin-left: 20px;
    }
    #meminfo2{
        border: 1px solid black;
        width: 40%;
        height: 200px; 
        text-align: left;
        float: right;
        margin-right: 20px;
    }
    #myPagePg{
        text-align: right;
    }
    .meminfo{
        text-align: left;
    }
    .meminfo2{
    	test-align: right;
    
    }
    .wrap{
        width: 800px;
        height: 200px;
        margin: auto;
    }
    .wrap>div{
        width: 90%;
    }
    .header>div{
        float: left;
        height: 100%;
    }
    #myPageMem{
        width: 50%;
    }
    #myPageLevel{
        width: 50%;
    }
    .header{
        margin-top: 65px;
        text-align: center;
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
    <div class="outer" align="center">
    
        <div class="wrap">
            <div id="tit"><h1>MYPAGE</h1></div>
            
            <div class="header">
                <div id="myPageMem"><h5><span>${ loginUser.userName }님, 환영합니다.</span></h5></div>
            
                <div id="myPageLevel"><h3>등급: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ loginUser.levelName }</h3> <br>
                    <div class="progress">
                        <div class="progress-bar bg-secondary" style="width:70%"></div>
                    </div>
                </div>
            
                
            </div>

        </div>
    <hr>

    <br><br>

    <div id="mymain" align="center">
        <a href="mypageLike.me">
        <div class="mpmain">
            <span class="material-symbols-outlined" id="like">favorite</span><br><br>
            찜한내역
        </div>
        </a>
        <a href="mypagePartyEnroll.me">
        <div class="mpmain" onclick="">
            <span class="material-symbols-outlined"  id="partylist">group</span><br><br>
            파티참여내역
        </div>
        </a>
        <a href="reviewList.my?userId=${loginUser.userId }">
        <div class="mpmain" onclick="">
            <span class="material-symbols-outlined" id="writechk">edit</span><br><br>
            작성글확인
        </div>
        </a>
        <a href="mypageUpdate.me">
        <div class="mpmain" onclick="">
            <span class="material-symbols-outlined" id="infomodi">account_circle</span><br><br>
            회원정보수정
        </div>
        </a>
    </div>

    <br><br>
    
        <div class="memtitle">

            <div class="meminfo">
                <h3>회원정보</h3>
            </div>

            <hr>

            <div id="meminfo" readonly>
                <div>아이디: ${ loginUser.userId }</div><br>
                <div>이름: ${ loginUser.userName }</div><br>
                <div>닉네임: ${ loginUser.userNickname }</div><br>

            </div>
            
            <div id="meminfo2" readonly>
	            <div>이메일: ${ loginUser.userEmail }</div><br>
	            <div>휴대폰번호: ${ loginUser.userPhone }</div><br>
	            <div>관심장르: ${loginUser.userGenre }</div><br>
            </div>
            
        </div>
        <br><br>

    </div>


</body>
</html>