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
        height: 220px; 
        text-align: center;
        float: left;
        margin-left: 20px;
    }
    #meminfo2{
        border: 1px solid black;
        width: 40%;
        height: 220px; 
        text-align: center;
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
            <div id="tit"><h1>MYPAGE</h1></div><br>
            
            <div class="header">
                <div id="myPageMem"><h3><span>${ loginUser.userName }???, ???????????????.</span></h3></div>
            
                <div id="myPageLevel"><h3>??????: &nbsp;&nbsp;${ loginUser.levelName }</h3></div>
            
                
            </div>

        </div>
    <hr>

    <br><br>

    <div id="mymain" align="center">
        <div class="mpmain" onclick="location.href='mypageLike.me'">
            <span class="material-symbols-outlined" id="like">favorite</span><br><br>
            ????????????
        </div>
        
        <div class="mpmain" onclick="location.href='partyMade.my?userId=${loginUser.userId }'">
            <span class="material-symbols-outlined"  id="partylist">group</span><br><br>
            ??????????????????
        </div>
        
        <div class="mpmain" onclick="location.href='mypageList.me?userId=${loginUser.userId }'">
            <span class="material-symbols-outlined" id="writechk">edit</span><br><br>
            ???????????????
        </div>
        
        <div class="mpmain" onclick="location.href='mypageUpdate.me'">
            <span class="material-symbols-outlined" id="infomodi">account_circle</span><br><br>
            ??????????????????
        </div>
        
    </div>

    <br><br>
    
        <div class="memtitle">

            <div class="meminfo">
                <h3>????????????</h3>
            </div>

            <hr>

            <div id="meminfo"><br>
                <div>?????????: ${ loginUser.userId }</div><br>
                <div>??????: ${ loginUser.userName }</div><br>
                <div>?????????: ${ loginUser.userNickname }</div><br>

            </div>
            
            <div id="meminfo2"><br>
	            <div>?????????: ${ loginUser.userEmail }</div><br>
	            <div>???????????????: ${ loginUser.userPhone }</div><br>
	            <div>????????????: ${loginUser.userGenre }</div><br>
            </div>
            
        </div>
        <br><br><br>

    </div>


</body>
</html>