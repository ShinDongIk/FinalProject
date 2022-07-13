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

<link rel="stylesheet" href="./resources/css/userFindUserFormStyle.css">



   
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    
    <c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
    
    <div class="outer">
        <div class="content1">
            <span class="subTitle">
                <b class="font-purple">아이디/비밀번호 </b><b>찾기</b>
            </span>
        </div>
        <br>
        <div class="content2">
       		<div class="custom-control custom-radio custom-control-inline">
	        	<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
				<label class="custom-control-label font-weight-bold" for="search_1">아이디 찾기</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
				<label class="custom-control-label font-weight-bold" for="search_2">비밀번호 찾기</label>
			</div>
        </div>
        
        <div class="content3">
            <div class="content3-1" id="searchId">
                <div class="inputArea">
                    <form action="findId.me" method="post" id="findId">
                        <table id="inputTable">
                            <tr>
                                <td colspan="2">
                                    <input type="text" placeholder="이름을 입력하세요" style="width: 100%;" class="form-control" name="idUserName" id="idUserName">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" >
                                    <input type="email" placeholder="이메일을 입력하세요" style="width: 100%;" class="form-control" name="idUserEmail" id="idUserEmail">
                                </td>
                            </tr>
                        </table>
                        <br>
<!--                         <button type="button" class="btn button-purple" id="btnSearchId" data-toggle="modal" data-target="#findedId">아이디 조회</button> <br><br> -->
                        <button type="button" class="btn button-purple" id="btnSearchId">아이디 조회</button> <br><br>
                    </form>
                </div>
            </div>

            <div class="content3-1" id="searchPwd" style="display:none;">
                <div class="inputArea">
                    <form action="findPwd.me" method="post" target="popup" onsubmit="window.open('findPwd.me', 'popup', 'width=700, height=400, left=(window.screen.width / 2) - (width/2), top=(window.screen.height / 4)');">
                        <table id="inputTable">
                            <tr>
                                <td colspan="2" style="width: 100%;">
                                    <input type="text" placeholder="아이디를 입력하세요" style="width: 100%;" class="form-control" name="pwdUserId" id="pwdUserId" required>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" >
                                    <input type="email" placeholder="이메일을 입력하세요" style="width: 100%;" class="form-control" name="pwdUserEmail" id="pwdUserEmail" required>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn button-purple" data-toggle="modal" data-target="#findedPwd">임시비밀번호 발송</button> <br><br>
                    </form>
                </div>
            </div>
            
            <script>

	            //찾기 선택
	        	function search_check(num) {
	        		if (num == '1') {
	        			document.getElementById("searchPwd").style.display = "none";
	        			document.getElementById("searchId").style.display = "";	
	        		} else {
	        			document.getElementById("searchId").style.display = "none";
	        			document.getElementById("searchPwd").style.display = "";
	        		}
	        	}
	            
	            //아이디 찾기
	            function idFind(){
	            	
	            	var name = $("#findIdUserName").val()
	            	var email = $("#findIdUserEmail").val()
	            	
	            	$.ajax({
						url : "findId.me",
						data : {
							idUserName : name,
							idUserEmail : email
						},
						success : function(result){
							console.log(result);
							if(data == 0){
								$('#id_value').text("회원 정보를 확인해주세요!");
								$('#name').val('');
								$('#phone').val('');
							} else {
								$('#id_value').text(result);
								$('#name').val('');
								$('#phone').val('');
								
							}
						},
						error : function(){
							console.log("ajax 통신 실패");
						}
					})
	            	
	            	//새창 만들기
// 	            	window.open("findId.me", "아이디 조회", "width=400, height=350");
	           	}
		        	
	 			//아이디 찾기
// 	 			$(document).ready(function(){
// 	 				$("#btnSearchId").click(function(){
// 	 					if($("#check1").is(":checked")==false){
// 	 						alert("이용 약관에 동의하셔야 가입 가능합니다.");
// 	 						$("#check1").focus();
// 	 					}else if($("#check2").is(":checked")==false){
// 	 						alert("개인정보 처리방침에 동의하셔야 가입 가능합니다.");
// 	 						$("#check2").focus();
// 	 					}else{
// 	 						$("#SearchId").submit();
// 	 					}
// 	 				});
// 	 			});
	 			
	 			
			        //회원가입버튼 클릭시 유효성검사(아이디, 비밀번호, 닉네임)
			   		$(document).ready(function(){
			   			//이메일용 유효성
			   			
			   			var mailRegExp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			   			$("#btnSearchId").click(function(){
							//필수입력
			   				if($("#idUserName").val()==""){
			   					alert("이름을 입력해주세요.");
			   					$("#idUserName").focus();
			   				}else if($("#idUserEmail").val()==""){
			   					alert("이메일을 입력해주세요.");
			   					$("#idUserEmail").focus();
							//유효성
			   				}else if(!mailRegExp.test($("#idUserEmail").val())){
			   					alert("이메일 형식을 확인해주세요");
			   					$("#idUserEmail").focus();
			   				}else{
			   					$("#findId").submit();
			   				}
			   			});
			   		});
            </script>
            
            
            <!-- 아이디찾기 Modal -->
<!-- 		    <div class="modal fade" id="findedId"> -->
<!--    				<div class="modal-dialog modal-dialog-centered"> -->
<!-- 		            <div class="modal-content"> -->
		
<!-- 				        Modal Header -->
<!-- 				        <div class="modal-header"> -->
<!-- 				          <h4 class="modal-title">아이디 조회 결과</h4> -->
<!-- 				          <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 				        </div> -->
		
<!-- 				        Modal body -->
<!-- 				        <div class="modal-body"> -->
<!-- 				          ID : admin -->
<%-- 				          userId = ${userId } --%>
<!-- 				        </div> -->
				        
<!-- 				        Modal footer -->
<!-- 				        <div class="modal-footer"> -->
<!-- 				          <button type="button" class="btn button-gray" data-dismiss="modal">닫기</button> -->
<!-- 				        </div> -->
<!-- 		            </div> -->
<!-- 		        </div> -->
<!-- 		    </div> -->
		    
		    <!-- 비밀번호찾기 Modal -->
<!-- 		    <div class="modal fade" id="findedPwd"> -->
<!--    				<div class="modal-dialog modal-dialog-centered"> -->
<!-- 		            <div class="modal-content"> -->
		
<!-- 				        Modal Header -->
<!-- 				        <div class="modal-header"> -->
<!-- 				          <h4 class="modal-title">임시비밀번호 발송 완료!</h4> -->
<!-- 				          <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 				        </div> -->
		
<!-- 				        Modal body -->
<!-- 				        <div class="modal-body"> -->
<!-- 				        	입력하신 메일주소 <b>user1@naver.com</b>로 <br> -->
<!-- 			                임시 비밀번호가 발송 되었습니다. -->
<%-- 			                ${findFwdUserId } --%>
<!-- 				        </div> -->
				        
<!-- 				        Modal footer -->
<!-- 				        <div class="modal-footer"> -->
<!-- 				          <button type="button" class="btn button-gray" data-dismiss="modal">닫기</button> -->
<!-- 				        </div> -->
<!-- 		            </div> -->
<!-- 		        </div> -->
<!-- 		    </div> -->
  
    	</div>
   	</div>
</body>
</html>