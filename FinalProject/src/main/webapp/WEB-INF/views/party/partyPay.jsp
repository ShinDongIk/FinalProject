<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ENJOY FOR OTT - 결제</title>
<jsp:include page="../common/menubar.jsp"/>
<!-- 아임포트 라이브러리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	
	${ payInfo }
	<br>
	${ pm }
	
	<form id="partyJoinData">
	    <!-- Payment -->
    	<input type="hidden" id="payPartyNo" name="payPartyNo" value="${ payInfo.payPartyNo }">
    	<input type="hidden" id="payUserId" name="payUserId" value="${ payInfo.payUserId }">
    	<input type="hidden" id="payName" name="payName" value="${ payInfo.payName }">
    	
    	<!-- PartyMember -->
	   	<input type="hidden" id="joinMember" name="joinMember" value="${ loginUser.userId }">
    	<input type="hidden" id="diffMonth" name="diffMonth" value="${ p.diffMonth }">
    </form>
	
	<script>
    $(function(){
    	var partyNo = $("#payPartyNo").val();
    	var userId = $("#payUserId").val();
    	var name = $("#payName").val();
    	var diffMonth = $("#diffMonth").val();
    	
    	
		//아임포트    	
    	var IMP = window.IMP;
		IMP.init('imp66833252'); //가맹점 식별코드
	    var msg;
		 
		IMP.request_pay({
		    pg: "html5_inicis",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : '${ payInfo.payName }',
		    amount : ${ payInfo.payAmount },
		    buyer_email : '${ payInfo.buyerEmail }',
		    buyer_name : '${ payInfo.buyerName }',
		    buyer_tel : '${ payInfo.buyerTel }',
		  }, function (rsp) { // callback
			  console.log("pg_tid"+rsp.pg_tid);
		      if (rsp.success) {
		      	console.log(partyNo);
		    	console.log(userId);
		    	console.log(name);
		    	console.log(diffMonth);
		        $.ajax({
                    url: "partyPayComplete.pa",
                    contentType : "application/json; charset=utf-8",
                    type: "POST",
                    data: {
                        imp_uid : rsp.imp_uid,			
                    	partyNo : partyNo,
                    	userId : userId,
                        payConfirmNo : rsp.pg_tid,
                        payName : name,
                        diffMonth : diffMonth
                    }
                }).done(function(data) {
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        alert(msg);
                    }
                });
		        window.location.href="./partyPayComplete.pa";
		      } else {
		        console.log("결제실패");
                var msg = rsp.error_msg;
                msg += ". 파티리스트 페이지로 이동합니다.";
                location.href="./partylist.pa";
		      }
		      alert(msg);
		  });
	
		});
	</script>
</body>
</html>