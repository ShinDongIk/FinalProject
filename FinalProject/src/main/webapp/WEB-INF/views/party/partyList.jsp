<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<script>
		var loginUserId = "${loginUser.userId}"; 
	</script>
    <div class="outer">
<<<<<<< HEAD
<!--         <div class="partyMenuArea"> -->
<!--             <nav class="navbar navbar-expand-sm fixed-top" id="partyMenu"> -->
<!--                 <ul class="navbar-nav tabs"> -->
<!--                     <li class="nav-item current" data-tab="tab1"> -->
<!--                         <a class="nav-link">통합</a> -->
<!--                     </li> -->
<!--                     <li class="nav-item" data-tab="tab2"> -->
<!--                         <a class="nav-link">넷플릭스</a> -->
<!--                         <input type="hidden" class="ottTypeName" value="netflix"> -->
<!--                     </li> -->
<!--                     <li class="nav-item" data-tab="tab3"> -->
<!--                         <a class="nav-link">웨이브</a> -->
<!--                         <input type="hidden" class="ottTypeName" value="wavve"> -->
<!--                     </li> -->
<!--                     <li class="nav-item" data-tab="tab4"> -->
<!--                         <a class="nav-link">티빙</a> -->
<!--                         <input type="hidden" class="ottTypeName" value="tving"> -->
<!--                     </li> -->
<!--                     <li class="nav-item" data-tab="tab5"> -->
<!--                         <a class="nav-link">디즈니+</a> -->
<!--                         <input type="hidden" class="ottTypeName" value="disneyplus"> -->
<!--                     </li> -->
<!--                     <li class="nav-item" data-tab="tab6"> -->
<!--                         <a class="nav-link">왓챠</a> -->
<!--                         <input type="hidden" class="ottTypeName" value="watcha"> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </nav> -->
<!--         </div> -->
=======
>>>>>>> refs/heads/back
        									
        <div class="newParty">
        	<a id="btnPartyEnroll" style="float:right">신규파티등록</a>
        </div>
        <div class="items">
        	<div class="tap-content ">
	        	<c:choose>
	        		<c:when test="${empty enrolledParty}">
	        			등록된 파티가 없습니다.
	        		</c:when>
	        		
	        		<c:when test="${empty enrolledParty}">
	        			<c:forEach var="ep" items="${enrolledParty}" varStatus="num">
				            <div class="itemRow ott_${ ep.partyOttEng } current">
				            	<input type="hidden" value="${ ep.partyOttEng }" class="ottType">
				                <div class="itemType">
				                    ${ ep.ottKor }
				                </div>
				                <div class="itemSeller" style="float: right;">
				                    <span class="userLevel" id="ulevel${ num.index }" style="color:rgb(64, 179, 192)">${ ep.levelName }</span><br>
				                    <span><a id="nickName" onClick="memModalOpen('${ ep.userNickname }');">${ ep.userNickname }</a></span> 
				                </div>
			                    <div class="itemDate">
			                        <span class="partyEndDate"><fmt:formatDate value="${ ep.partyEndDate }" type="both" pattern="yy-MM-dd"/>까지</span>(<b class="diffDay">${ ep.ableDays }</b>일)
			                    </div>
			                    <div class="itemPrice" style="float: right;">
			                        <span class="totalAmount" id="tAmount${ num.index }"></span>원
			                    </div>
				                <div class="itemMembers">
									<span>가입가능인원<span>&ensp;${ ep.ableMemNum }/${ ep.partyCount }</span></span>
				                </div>
				                <div class="itemJoin" style="float: right;">
	       			            	<input type="hidden" value=${ ep.partyNo } id="pno">
				                    <button type="button" class="button-deepPurple btnJoin" id="btnJoin" onclick="location.href='partyjoin.pa?pno=${ ep.partyNo }'">파티가입</button>
				                </div>
				            </div>
			            </c:forEach>
	        		</c:when>
	        		
	        		<c:otherwise>
			            <c:forEach var="ep" items="${enrolledParty}" varStatus="num">
				            <div class="itemRow ott_${ ep.partyOttEng } current">
				            	<input type="hidden" value="${ ep.partyOttEng }" class="ottType">
				                <div class="itemType">
				                    ${ ep.ottKor }
				                </div>
				                <div class="itemSeller" style="float: right;">
				                    <span class="userLevel" id="ulevel${ num.index }" style="color:rgb(64, 179, 192)">${ ep.levelName }</span><br>
				                    <span><a id="nickName" onClick="memModalOpen('${ ep.userNickname }');">${ ep.userNickname }</a></span> 
				                </div>
			                    <div class="itemDate">
			                        <span class="partyEndDate"><fmt:formatDate value="${ ep.partyEndDate }" type="both" pattern="yy-MM-dd"/>까지</span>(<b class="diffDay">${ ep.ableDays }</b>일)
			                    </div>
			                    <div class="itemPrice" style="float: right;">
			                        <span class="totalAmount" id="tAmount${ num.index }"></span>원
			                    </div>
				                <div class="itemMembers">
									<span>가입가능인원<span>&ensp;${ ep.ableMemNum }/${ ep.partyCount }</span></span>
				                </div>
				                <div class="itemJoin" style="float: right;">
	       			            	<input type="hidden" value=${ ep.partyNo } id="pno">
				                    <button type="button" class="button-deepPurple btnJoin" id="btnJoin" onclick="location.href='partyjoin.pa?pno=${ ep.partyNo }'">파티가입</button>
				                </div>
				            </div>
			            </c:forEach>
	        		</c:otherwise>
	            </c:choose> 
            </div>
            <br>
    	</div>   
    	
    	<script src="${pageContext.request.contextPath}/js/ratePlanTab.js"></script>
		<c:if test="${not empty loginUser}">
			<jsp:include page="../chat/chat.jsp"/>
		</c:if>
    	
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
	    	
	    	//등급별 색상 변경
	    	$(document).ready(function(){
	    		var list1 = new Array();
	    		var bronze = "브론즈";
	    		var silver = "실버";
	    		var gold = "골드";
	    		var pla = "플레티넘";
	    		var dia = "다이아";
	    		
	            <c:forEach var="e" items="${enrolledParty}">
	    			list1.push("${e.levelName}");
	    		</c:forEach>
	    		for(var i=0; i<list1.length; i++){
	    			if(list1[i].match(bronze)){
	    				$("#ulevel"+[i]).css("color","rgb(195, 120, 0)");
	    			}else if(list1[i].match(silver)){
	    				$("#ulevel"+[i]).css("color","rgb(113, 113, 113)");
	    			}else if(list1[i].match(gold)){
	    				$("#ulevel"+[i]).css("color","rgb(202, 185, 4)");
	    			}else if(list1[i].match(pla)){
	    				$("#ulevel"+[i]).css("color","rgb(64, 179, 192)");
	    			}else if(list1[i].match(dia)){
	    				$("#ulevel"+[i]).css("color","rgb(255, 209, 248)");
	    			}
	    		}
	    	})
	    	
	    	//금액 계산 및 출력
			$(document).ready(function(){
	    		var ottchked = new Array();
	            <c:forEach var="e" items="${enrolledParty}">
	            	ottchked.push("${e.partyOttEng}");
    			</c:forEach>
    			
	    		var ableDays = new Array();
	            <c:forEach var="e" items="${enrolledParty}">
	            	ableDays.push("${e.ableDays}");
				</c:forEach>
				
				$.ajax({
					url : "ottInfoList.pa",
					data : {
						ottEng : ottchked
						},
					success : function(result){
																		
						for(var i=0; i<ottchked.length; i++){
							var totalAmount = (ableDays[i] * result[i]).toLocaleString('ko-KR');
							$("#tAmount"+[i]).html(totalAmount);
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				})
			})
			
    	</script>
    </div>
</body>
</html>