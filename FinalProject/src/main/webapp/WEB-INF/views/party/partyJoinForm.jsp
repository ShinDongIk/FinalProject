<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/menubar.jsp"/>

<link rel="stylesheet" href="./resources/css/partyJoinFormStyle.css">

</head>
<body>
	<script>
		var loginUserId = "${loginUser.userId}"; 
	</script>
    <div class="outer">
        <form action="partyPayForm.pa" id="partyJoin" method="post">
            <div class="content1">
                <div class="content2">
                    <span class="subTitle"><b class="font-purple">파티 </b><b>규칙</b></span><br><br>
                    <textarea class="agreement" readonly>${ p.partyRule }</textarea>
                    <br>
                    <div class="agreechk">    
                        <input type="checkbox" id="check1"> <label class="chkLabel" for="check1"> 파티규칙 동의</label><br>
                    </div>
                </div>

                <div class="content2">
                    <span class="subTitle">
                        <b class="font-purple">환불 </b><b>정책</b>
                    </span><br><br>
                <textarea class="agreement" readonly>
▶ 환불 진행 절차
판매자의 귀책사유로 서비스 이용이 제한되는 직 후, 파티장(판매자)에게 문제해결 요청을 반드시 진행 해야하며, 요청 진행 후 24시간 내에 조치가 진행되지 않을 경우 환불이 진행 됩니다.
참여자(구매자)가 문제해결 요청한 내용은 분쟁해결 및 환불내용에 자료로 사용 될 수 있습니다.
환불신청은 [결제내역조회] 페이지에서 가능하며, 환불 비용은 환불신청을 진행한 날짜의 +1일로 계산되어 환불이 진행 됩니다.
위 사항에 해당하는 경우 파티장 의사와 상관없이 벗츠에서 환불비용을 부담하여 제공하고 있으며, 포인트 환불로 진행됩니다.

▶ 환불 불가
구매자의 필요 사항에 의한 요구일 경우 환불이 반려 될 수 있습니다.
예) 성인인증 및 핀번호 설정 등 불편하지만 구매자가 직접 설정할 수 있는 영역
환불신청은 [결제내역조회] 페이지에서 가능하며, 환불 비용은 환불신청을 진행한 날짜의 +1일로 계산되어 환불이 진행 됩니다.
예) 프로그램 오류, 네트워크 환경 불안으로 인한 오류 등
위 사항에 해당하는 경우 파티장 의사와 상관없이 벗츠에서 환불비용을 부담하여 제공하고 있으며, 포인트 환불로 진행됩니다.
                </textarea><br>
            <div class="agreechk">
                <input class="chkInput" type="checkbox" id="check2"> <label class="chkLabel" for="check2">환불정책 동의</label><br>
            </div>
        </div>
    </div>
    <br><br><br>
	${ p }
    <div class="content1">
    <span class="subTitle">
        <b class="font-purple">결제 </b><b>정보</b>
    </span><br><br>
    	<input type="hidden" value="${ p.partyOttEng}" id="ottType">
        <table class="table">
            <thead class="table-active">
                <tr>
                    <th>서비스명</th>
                    <th>시작일</th>
                    <th>종료일</th>
                    <th>이용일수</th>
                    <th>일일요금</th>
                    <th>합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${ p.ottKor }</td>
                    <td id="startDate"></td>
                    <td id="endDate">${ p.partyEndDate }</td>
                    <td><span id="diffDays">${ p.ableDays }</span>일</td>
                    <td><span id="perOneDayPrice"></span>원</td>
                    <td><b style="font-size: large;"><span id="totalAmount"></span>원</b></td>
                </tr>
            </tbody>
        </table>
    </div>
    <br><br><br>

    <div class="content1">
        <div class="content2">
            <span class="subTitle">
                <b class="font-purple">결제자 </b><b>정보</b>
            </span><br><br>
            <table class="table">
                <tr>
                    <td>
                        <b>아이디</b>
                    </td>
                    <td>${ loginUser.userId }</td>
                </tr>
                <tr>
                    <td>
                        <b>이름</b>
                    </td>
                    <td>${ loginUser.userName }</td>
                </tr>
            </table>
        </div>
        <div class="content2">
            <span class="subTitle">
                <b class="font-purple">결제 </b><b>방법</b>
            </span><br><br><br>
            <div width="80%">
                    <input type="radio" id="creditCard" checked>카드결제
            </div>
        </div>
    </div>

    <div class="content1">
        <p id="notice" style="text-align: left;">
            <b>유의사항</b><br> 
            1.‘ENJOY OTT’는 사용자간의 컨텐츠 비용을 나눔을 할 수 있도록 지원해 드리고 있으며, 참여하신 서비스의 주체가 아닙니다. <br>
            2. 개별 공급자가 등록한 나눔 내용 및 거래에 대한 책임은 공급자가 부담하며, 이에 따라서 공급자가 진행하는 서비스에 대해서 ‘벗츠’는 어떠한 책임과 의무를 지지 않습니다. <br>
            3. 파티장 연락두절 및 이용불가능한 상태 방치 등에 의한 환불인 경우 벗츠에서 남은 기간에 대한 환불을 보장하며, 포인트로 환불 진행됩니다. (단 참여 후 3일이 경과되지 않았을 경우 지불했던 수단으로 100% 환불) <br>
            ※ 서비스 참여 중에 판매자의 실수를 비롯 하여 네트워크, 서비스 제공업체, 다른 파티원 등의 문제로 의도치 않는 문제가 발생 할 수 있습니다. 문제 발생 시 상호간 매너있는 대화 부탁드리며, 부적절한 언어 선택 시 이용제한 등의 조치가 진행 될 수 있습니다.
        </p>
    </div>
    <br><br><br>
    
	<input type="hidden" name="partyEndDate" value="${ p.partyEndDate }">
    
    <div id="partyJoinData">
    	<!-- Payment -->
    	<input type="hidden" name="payName" value="${ p.ottKor }(${ p.ableDays }일)">
    	<input type="hidden" name="payAmount" id="payAmount">
    	<input type="hidden" name="buyerEmail" value="${ loginUser.userEmail }">
    	<input type="hidden" name="buyerName" value="${ loginUser.userName }">
    	<input type="hidden" name="buyerTel" value="${ loginUser.userPhone }">
    	<input type="hidden" name="payPartyNo" value="${ p.partyNo }">
    	<input type="hidden" name="payUserId" value="${ loginUser.userId }">
    	<!-- PartyMember -->
   	    <input type="hidden" name="joinParty" value="${ p.partyNo }">
	   	<input type="hidden" name="joinMember" value="${ loginUser.userId }">
    	<input type="hidden" name="diffMonth" value="${ p.diffMonth }">
    </div>
    
    <div class="buttonArea">    
        <button type="button" class="btn button-gray" onclick="history.back(-1);">취소</button>
        <button type="button" class="btn button-purple" id="btnMoveToPay">결제</button>
    </div>
    </form>
    
    <script src="${pageContext.request.contextPath}/js/ratePlanTab.js"></script>
    
    <script>
    	$(document).ready(function(){
     		//현재 날짜 시작일에 입력
     		var now = new Date();

     		var sYear = now.getFullYear();
     		var sMonth = ('0' + (now.getMonth() + 1)).slice(-2);
     		var sDay = now.getDate();
     		
     		var sDate = sYear+"-"+sMonth+"-"+sDay;
     		$("#startDate").html(sDate);
     		
     		var ottchked = $("#ottType").val();
     		var diffDays = $("#diffDays").text();

       		$.ajax({
    			url : "ottInfo.pa",
				data : {
					ottEng : ottchked
					},
				success : function(result){
					//총금액 계산
					var totalAmount = (diffDays * result.perOneDayPrice).toLocaleString('ko-KR');
					var payAmount = diffDays * result.perOneDayPrice;
					
					//일단가, 총금액 출력
		 			$("#perOneDayPrice").html(result.perOneDayPrice);
			        $("#totalAmount").html(totalAmount);	
			        $("#payAmount").val(payAmount);
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			})
    	})
    	
   	   	//동의 필수 체크 후 결제 이동
  		$(document).ready(function(){
  			$("#btnMoveToPay").click(function(){
  				if($("#check1").is(":checked")==false){
  					alert("파티규칙에 동의하셔야 가입 가능합니다.");
  					$("#check1").focus();
  				}else if($("#check2").is(":checked")==false){
  					alert("환불정책에 동의하셔야 가입 가능합니다.");
  					$("#check2").focus();
  				}else{
  					$("#partyJoin").submit();
  				}
  			});
  		});
    	

    </script>
</div>
<br><br>
</body>
</html>