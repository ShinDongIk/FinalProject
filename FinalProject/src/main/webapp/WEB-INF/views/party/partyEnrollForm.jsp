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

<link rel="stylesheet" href="./resources/css/partyEnrollFormStyle.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />

</head>
<body>

<jsp:include page="../common/menubar.jsp" />   
 
    <div class="outer">
        <br>
        <span class="subTitle">
            <b class="font-purple">신규파티 </b><b>등록</b>
        </span>
        <hr>
        <div class="joimForm">
            <div class="notice" style="text-align: left;">
                	🔔 <b> 파티 등록 전 꼭 확인해주세요!</b> <br><br>
                * 개인 연락처 또는 카카오톡, 개인간 거래 유도 행위는 불법으로 간주하며, 적발시 사전동의 없이 파티장 권한이 중지 됩니다. <br>
                * 작성된 정보는 당사에 수집되며 진행 중인 파티에 문제가 발생한 경우에 확인 및 해결을 위해 활용 될 수 있습니다. <br>
                * 파티 금액 정산가능 소요일은 <a>등급별</a>로 상이합니다.<br>
                * 4K 화질의 계정만 공유 가능합니다.
            </div>
            <br><br>
            <form action="enrollparty.pa" id="enrollParty" method="post">
               	<input type="hidden" value="${ loginUser.userId }" name="partyMaster">
                <table class="joinTable table" align="center">
                    <tr>
                        <th>
                        	<span>OTT 선택</span> <br>
                        	<span id="perOneDayPriceStr">

                       		</span>
                        </th>
                        <td>
                            <div class="logoArea">
                            	<div class="logoImgArea">
	                                <img src="./resources/images/netflix.png" alt="" class="logoImg" id="netflix" ><br>
                            	    <span class="ottNameKor">넷플릭스</span>
                            	    <input type="hidden" class="ottNameEng" value="netflix">
                            	</div>
                            </div>
                            <div class="logoArea">
                                <img src="./resources/images/wave.png" alt="" class="logoImg" id="wavve"><br>
                                <span class="ottNameKor">웨이브</span>
                                <input type="hidden" class="ottNameEng" value="wavve">
                            </div>
                            <div class="logoArea">
                                <img src="./resources/images/tving.png" alt="" class="logoImg" id="tving"><br>
                                <span class="ottNameKor">티빙</span>
                                <input type="hidden" class="ottNameEng" value="tving">
                            </div>
                            <div class="logoArea">
                                <img src="./resources/images/Disney.png" alt="" class="logoImg" id="disneyplus"><br>
                                <span class="ottNameKor">디즈니+</span>
                                <input type="hidden" class="ottNameEng" value="disneyplus">
                            </div>
                            <div class="logoArea">
                                <img src="./resources/images/watcha.png" alt="" class="logoImg" id="watcha"><br>
                                <span class="ottNameKor">왓챠</span>
                                <input type="hidden" class="ottNameEng" value="watcha">
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>
                        	모집인원<br>
                        	<span style="font-size: 9px"> (동시시청가능 인원 기준)</span>
                        </th>
                        <td>
                            <div class="partyMemberNum">
                                &ensp;
                                <span class="font-medium">
                            		<input type="text" name="partyCount" id="partyCount" min="1" maxlength="2" class="form-control harfInput" required>
                                    / 최대인원 <b class="font-purple amountVal" id="concurrentUsersResult"></b>명
                                </span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>진행기간</th> 
                        <td>
	                        <input type="date" class="form-control" id="partyStartDate" name="partyStartDate" style="width:35%" required readonly>
	                        <p class="etc">～</p>
	                        <input type="date" class="form-control" id="partyEndDate" name="partyEndDate" style="width:35%" required>
                        </td>
                    </tr>
                    <tr>
                        <th>예상수령금액</th> 
                        <td>
                        	<div id="amountArea">
	                            <div class="quarterupInput" style="float:left;">
	                            	<span class="priceInfo" id="perDay"></span> 원
	                                <span class="operator">&ensp;*&ensp;</span>
	                                <span class="priceInfo" id="memNum"></span> 명
	                                <span class="operator">&ensp;*&ensp;</span>
	                                <span class="priceInfo" id="diffDay"></span> 일
	                                <span class="operator">&ensp;=&ensp;</span>
	                                <span class="priceInfo font-purple" id="totalAmount"></span>원
	                            </div>
                                <button type="button" class="button-clear" id="btnAmount" style="float:right; height:40px">조회</button>
                        	</div>
                            
                        </td>
                    </tr>
                    <tr>
                        <th>
	                        수령계좌정보<br>
	                       	<span style="font-size: 9px"> (본인 계좌만 가능합니다)</span>
                        </th>
                        <td>
                            <select class="form-control quarterInput" name="partyAccountBank">
                                <option value="카카오">카카오</option>
                                <option value="국민">국민</option>
                                <option value="우리">우리</option>
                                <option value="신한">신한</option>
                                <option value="하나">하나</option>
                                <option value="SC">SC</option>
                            </select>
                            <p class="etc">　</p>
                            <input type="text" class="form-control harfInput" name="partyAccountNum" id="partyAccountNum" placeholder="계좌번호" required>
                            <p class="etc">　</p>
                            <input type="text"class="form-control quarterInput" value="${loginUser.userName }" style="text-align:center;" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>공유계정정보</th>
                        <td>
                            <input type="text" class="form-control harfInput" id="partyOttId" name="partyOttId" placeholder="아이디" required>
                            <p class="etc">　</p>
                            <input type="text"class="form-control harfInput" id="partyOttPwd" name="partyOttPwd" placeholder="비밀번호">
                        </td>
                    </tr>

                    <tr>
                        <th>파티규칙</th>
                    <td>
                        <textarea class="form-control" id="partyRule" name="partyRule" cols="30" rows="10" style="resize: none;"></textarea>
                    </td>
                </tr>
            </table>
            <br>
            <button type="button" class="btn button-gray">취소</button>
            <button type="button" class="btn button-purple" id="btnEnrollParty">등록</button>
         </form>
         
         <script>
         	//시작일 오늘 고정, 종료일 오늘 이후
         	let today = new Date();
			let day = today.getDate();
			let month = today.getMonth() + 1; // 1월이 0부터 시작되므로 +1
			let year = today.getFullYear();
			if (day < 10) day = '0' + day;
			if (month < 10) month = '0' + month;
			today = year + '-' + month + '-' + day;
			
			document.getElementById("partyStartDate").setAttribute("value", today);
			document.getElementById("partyEndDate").setAttribute("min", today);
			
         	//OTT 선택시 일단가 출력
         	$(".logoArea").click(function(){
         		var ottchked = $(this).find('img').attr("id");
        	 
//            	 	console.log(ottchked); 
           	 	$(".logoImg").removeClass('ottChked');
           	 	$(".ottNameEng").removeAttr('name');
           	 	$(".ottNameKor").removeAttr('style');
           	 	$(this).find('img').addClass('ottChked');
           	 	$(this).find('input').attr('name','partyOttEng');
           	 	$(this).find('span').attr('style','font-weight:bold;');
        	 	
           	 	
	       		$.ajax({
	    			url : "ottInfo.pa",
					data : {
						ottEng : ottchked
						},
					success : function(result){
// 			 			console.log(result);
			 			//일단가 출력
			 			var perOneDayPriceStr =""
			 			perOneDayPriceStr += "<br><span class='amountVal'>"
			 								+ ottchked
			 								+ "</span><br>"
			 								+ "일 <span class='font-purple amountVal'>"
			 								+ result.perOneDayPrice
			 								+ "</span>원/(1인)"
			 			$("#perOneDayPriceStr").html(perOneDayPriceStr);
			 			//최대인원 출력
			 			$("#concurrentUsersResult").html(result.concurrentUsers);
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				});	
         	});
         	
         	//예상수령금액 조회
         	$("#btnAmount").click(function(){
         		//일수 계산
         		var now = new Date();
         		var chkDate = $("#partyEndDate").val();
         		var chkDateArr = chkDate.split("-");

         		var sYear = now.getFullYear();
         		var sMonth = now.getMonth()+1;  
         		var sDay = now.getDate();

         		var startDate = new Date(sYear, sMonth, sDay);
         		var endDate = new Date(chkDateArr[0],chkDateArr[1],chkDateArr[2]);
         		
         		var diffMs = endDate.getTime() - startDate.getTime() ; //getTime 밀리초로 변환(1000밀리초=1초)
         		var diffDay = diffMs / (1000*60*60*24) + 1 ; //당일포함
         		
         		//ott일단가, 모집인원 값
	     		var perDay = ($("#perOneDayPriceResult").text()).toLocaleString('ko-KR');
	     		var memNum = ($("#partyCount").val()).toLocaleString('ko-KR');
	     		
	     		//금액 계산식
	     		var totalAmount = (diffDay * perDay * memNum).toLocaleString('ko-KR');
// 	     		console.log(totalAmount);
	     		
	     		//출력
   				if($(".logoImg").hasClass('ottChked')==false){
					alert("공유할 OTT를 선택해주세요.");
					$(".logoArea").focus();
   				}else if($("#partyCount").val()==""){
   					alert("모집인원을 입력해주세요.");
   					$("#partyCount").focus();
   				}else if($("#partyEndDate").val()==""){
   					alert("종료일을 선택해주세요.");
   					$("#partyEndDate").focus();
   				}else{
   	         		$("#diffDay").html(diffDay);
   	         		$("#perDay").html(perDay);
   	         		$("#memNum").html(memNum);
   	         		$("#totalAmount").html(totalAmount);	
   				}
         	});
         	
         	//유효성검사
	        $(function(){
	        	var regExp = /^[0-9]/;
	        	var $pCount = $("#enrollParty input[name=partyCount]");
	        	
		        $pCount.keyup(function(){
	   				if($pCount.val()==""){
						alert("모집 할 인원수를 입력해주세요.");
						$("#partyCount").focus();
	   				}else if(!regExp.test($pCount.val())){
	//    					console.log($pCount.val());
						$("#partyCount").val("");
						$("#partyCount").focus;
						alert("숫자만 입력 가능합니다.");
						return false;
				    }
		       	})
	        })
	        $(function(){
	        	var regExp = /^[0-9]/;
		        var $pAccountNum = $("#enrollParty input[name=partyAccountNum]");
	        	
		        $pAccountNum.keyup(function(){
	   				if($pAccountNum.val()==""){
						alert("정산금액을 수령할 계좌번호를 입력해주세요.");
						$("#partyAccountNum").focus();
	   				}else if(!regExp.test($pAccountNum.val())){
	//    					console.log($pAccountNum.val());
						$("#partyAccountNum").val("");
						$("#partyAccountNum").focus;
						alert("숫자만 입력 가능합니다.");
						return false;
				    }
		       	})
	        })
         	
         	//등록버튼 클릭시 필수입력 확인
	   		$(document).ready(function(){
	   			$("#btnEnrollParty").click(function(){
		     		var maxMemNum = $("#concurrentUsersResult").text();
		     		console.log(maxMemNum);
	   				if($(".logoImg").hasClass('ottChked')==false){
						alert("공유할 OTT를 선택해주세요.");
						$(".logoArea").focus();
	   				}else if($("#partyCount").val()==""){
	   					alert("모집인원을 입력해주세요.");
	   					$("#partyCount").focus();
	   				}else if($("#partyCount").val()>maxMemNum){
	   					alert("모집 가능인원을 초과하였습니다.");
	   					$("#partyCount").focus();
	   				}else if($("#partyEndDate").val()==""){
	   					alert("종료일을 선택해주세요.");
	   					$("#partyEndDate").focus();
	   				}else if($("#partyAccountNum").val()==""){
	   					alert("정산금액을 수령할 계좌번호를 입력해주세요.");
	   					$("#partyAccountNum").focus();
	   				}else if($("#partyOttId").val()==""){
	   					alert("공유계정 아이디를 입력해주세요.");
	   					$("#partyOttId").focus();
	   				}else if($("#partyOttPwd").val()==""){
	   					alert("공유계정 비밀번호를 입력해주세요.");
	   					$("#partyOttPwd").focus();
	   				}else if($("#partyRule").val()==""){
	   					alert("파티규칙을 입력해주세요.");
	   					$("#partyRule").focus();
	   				}else{
	   					$("#enrollParty").submit();
	   				}
	   			});
	   		});
         	         	
         </script>
       </div>        
    </div>
</body>
</html>