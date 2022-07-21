<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="./resources/css/partyListStyle.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />

</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <div class="partyMenuArea">
            <nav class="navbar navbar-expand-sm fixed-top" id="partyMenu">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">통합</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">넷플릭스</a>
                        <input type="hidden" class="ottTypeName" value="netflix">
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">웨이브</a>
                        <input type="hidden" class="ottTypeName" value="wavve">
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">티빙</a>
                        <input type="hidden" class="ottTypeName" value="tving">
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">디즈니+</a>
                        <input type="hidden" class="ottTypeName" value="disneyplus">
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">왓챠</a>
                        <input type="hidden" class="ottTypeName" value="watcha">
                    </li>
                </ul>
            </nav>
        </div>
        									
        <div class="newParty">
        	<a id="btnPartyEnroll" style="float:right">신규파티등록</a>
        </div>
        <div class="items">
        ${ enrolledParty }
        	<c:choose>
        		<c:when test="${empty enrolledParty}">
        			등록된 파티가 없습니다.
        		</c:when>
        		<c:otherwise>
		            <c:forEach var="ep" items="${enrolledParty}">
		            	<input type="hidden" value="${ ep.partyOttEng }" class="ottType">
			            <div class="itemRow">
			                <div class="itemType">
			                    ${ ep.ottKor }
			                </div>
			                <div class="itemSeller" style="float: right;">
			                    <span class="userLevel" style="color:rgb(64, 179, 192)">${ ep.levelName }</span><br>
			                    <span>${ ep.userNickname }</span> 
			                </div>
		                    <div class="itemDate">
		                        <span class="partyEndDate">${ ep.partyEndDate }까지</span>(<b class="diffDay"></b>일)
		                    </div>
		                    <div class="itemPrice" style="float: right;">
		                        <span class="totalAmount"></span>원
		                    </div>
			                <div class="itemMembers">
			                	<c:forEach begin="1" end="${ ep.partyCount }">
				                    <span class="material-symbols-outlined" style="color: gray;">person</span>
<!-- 			                    <span class="material-symbols-outlined" style="color: #a8b0ff;">person</span> -->

			                	</c:forEach>
			                </div>
			                <div class="itemJoin" style="float: right;">
       			            	<input type="hidden" value=${ ep.partyNo } id="pno">
			                    <button type="button" class="button-deepPurple btnJoin" id="btnJoin" onclick="location.href='partyjoin.pa?pno=${ ep.partyNo }'">파티가입</button>
			                </div>
			            </div>
		            </c:forEach>
        		</c:otherwise>
            </c:choose> 
            <br>
            <button id="btnMoreView">더보기</button>
    	</div>   
    	
    	<script>
    		//신규파티등록, 파티가입 로그인 필수
	    	$(function(){
	    		var loginUserId = "${ loginUser.userId }";
	    		$(".btnJoin").click(function(){
	    			if(loginUserId == ""){
	    				alert("로그인 후 이용 하실수 있습니다.");
	    				location.href="loginForm.me";
	    			}
	    		})
	    	})
	    	$(function(){
	    		var loginUserId = "${ loginUser.userId }";
	    		$("#btnPartyEnroll").click(function(){
	    			if(loginUserId == ""){
	    				alert("로그인 후 이용 하실수 있습니다.");
	    				location.href="loginForm.me";
	    			}else{
	    				location.href="partyenrollForm.pa";
	    			}
	    		})
	    	})
	    	
	    	//일수, 금액 계산 및 출력
			$(document).ready(function(){
				var now = new Date();
				var chkDate = $(".partyEndDate").text();

				var chkDateArr1 = chkDate.split("까지");
				
				for(int i)
// 				var chkDateArr2 = chkDateArr1.split("-");
				
				console.log(chkDate);
				console.log(chkDateArr1);
// 				console.log(chkDateArr2);
				
// 				var sYear = now.getFullYear();
// 				var sMonth = now.getMonth()+1;  
// 				var sDay = now.getDate();
				
// 				var startDate = new Date(sYear, sMonth, sDay);
// 				var endDate = new Date(chkDateArr[0],chkDateArr[1],chkDateArr[2]);
				
// 				console.log("s:"+startDate);
// 				console.log("e:"+endDate);
				
// 				var diffMs = endDate.getTime() - startDate.getTime() ; //getTime 밀리초로 변환(1000밀리초=1초)
// 				var diffDay = diffMs / (1000*60*60*24) + 1 ; //당일포함
				
// 				$(".diffDay").html(diffDay);
				
// 				var ottchked = $(".ottType").val();
			
// 				$.ajax({
// 					url : "ottInfo.pa",
// 					data : {
// 						ottEng : ottchked
// 						},
// 					success : function(result){
// 						//총금액 계산
// 						var totalAmount = (diffDay * result.perOneDayPrice).toLocaleString('ko-KR');
						
// 						//일단가, 총금액 출력
// 				        $(".totalAmount").html(totalAmount);	
// 					},
// 					error : function(){
// 						console.log("ajax 통신 실패");
// 					}
// 				})
			})
    	</script>
    </div>
</body>
</html>