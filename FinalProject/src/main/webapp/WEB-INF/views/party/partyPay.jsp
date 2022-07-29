<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ENJOY FOR OTT - 결제</title>
<jsp:include page="../common/menubar.jsp" />
<!-- 아임포트 라이브러리 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>

	<div id="partyJoinData">
		<!-- Payment -->
		<input type="hidden" id="payPartyNo" name="payPartyNo"
			value="${ payInfo.payPartyNo }"> <input type="hidden"
			id="payUserId" name="payUserId" value="${ payInfo.payUserId }">
		<input type="hidden" id="payName" name="payName"
			value="${ payInfo.payName }">

		<!-- PartyMember -->
		<input type="hidden" id="joinMember" name="joinMember"
			value="${ loginUser.userId }"> <input type="hidden"
			id="diffMonth" name="diffMonth" value="${ pm.diffMonth }">
	</div>

	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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
		    merchant_uid : 'merchant_'+new Date().getTime(), //상점에서 관리하는 주문 번호
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
		    	
				const dataArr = {
						payPartyNo : partyNo,
						payUserId : userId,
						payConfirmNo : rsp.pg_tid,
						payName : name,
						diffMonth : diffMonth,
						};
				var jsonData = JSON.stringify(dataArr);
				
				console.log(jsonData);
				console.log(dataArr);
		    	
                jQuery.ajax({
                    url: "partyPayComplete.pa", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                    	dataArr : jsonData,
                    }
                }).done(function(data) {
                  if ( everythings_fine ) {
                	alert('결제가 완료되었습니다.');
                  }
                });
		        window.location.href="./partyPayCompleteForm.pa";
		      } else {
		        console.log("결제실패");
                var msg = rsp.error_msg;
                msg += ". 파티리스트 페이지로 이동합니다.";
		        alert(msg);
                location.href="./partylist.pa";
		      }
		  });
	
		});
	</script>
</body>
</html>