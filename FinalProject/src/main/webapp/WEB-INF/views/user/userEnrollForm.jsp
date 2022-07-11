<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="./resources/css/userEnrollFormStyle.css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div class="outer">
        <br>
        <span class="subTitle">
            <b class="font-purple">신규회원 </b><b>가입</b>
        </span>
        <hr>
        <div class="joimForm">
            <form action="join.me" method="post" id="joinUser">
                <table class="joinTable" align="center">
                    <tr>
                        <th width="20%">*아이디</th>
                        <td width="60%">
                            <input type="text" class="form-control" name="userId" id="userId" required>
                        </td>
                        <td>
                            <button type="button" class="button-clear" id="btnId" onclick="idCheck();">중복확인</button>
                        </td>
                    </tr>
                    <tr>
                    	<th></th>
                        <td colspan="2" class="font-info">
                            <div id="idcheck">
		                        영소문자, 숫자, _입력가능, 최소 4글자 최대 15글자 입력해주세요.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>*비밀번호</th>
                        <td>
                            <input type="password" class="form-control" name="userPwd" id="userPwd" required>
                        </td>
                    </tr>
                    <tr>
                        <th>*비밀번호 확인</th>
                        <td>
                            <input type="password" class="form-control" name="userPwdChk" id="userPwdChk" required>
                        </td>
                    </tr>
                    <tr>
                    	<th></th>
                        <td colspan="2" class="font-info">
                        	<div id="pwdCheck">
                        		최소 4글자 이상 동일하게 입력해주세요.
                        	</div>
                        </td>
                    </tr>
                    <tr>
                        <th>*이름</th>
                        <td><input type="text" class="form-control" name="userName" id="userName" required></td>
                    </tr>
                    <tr>
                        <th>*닉네임</th>
                        <td>
                            <input type="text" class="form-control" name="userNickname" id="userNickname" required>
                        </td>
                        <td>
                            <button type="button" class="button-clear" id="btnNickname" onclick="nicknameCheck();">중복확인</button>
                        </td>
                    </tr>
                    <tr>
                    	<th></th>
                        <td colspan="2" class="font-info">
                            <div id="nicknamecheck">
		                        영문자, 한글, 숫자 입력가능, 최소 2글자 최대 12글자 입력해주세요.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>*이메일</th>
                        <td>
                            <input type="email" class="form-control" name="userEmail" id="userEmail" required>
                        </td>
                        <td>
                            <button type="button" class="button-clear" id="btnSendMailCode">인증코드 발송</button>
                        </td>
                    </tr>
                    <tr>
                        <th>*인증코드</th>
                        <td>
                        	<div id="emailCodeBox">
	                        	<input type="text" class="form-control" id="emailCode" disabled="disabled" maxlength="6">
                        	</div>
                        </td>
                    </tr>
                    <tr>
                    	<th></th>
                        <td colspan="2" class="font-info">
                        	<div id="emailCodeCheck">
                        		발송된 인증번호를 입력해주세요.
                        	</div>
                        </td>
                    </tr>
                    <tr>
                        <!-- 하이픈형식 000-0000-0000 -->
                        <th>*휴대폰 번호</th>
                    <td><input type="text" class="form-control" name="userPhone" id="userPhone" required></td>
                    </tr>
                    <!--
                        <tr>
                            <th>프로필사진</th>
                            <td>
                            <label class="button-clear" for="profile">파일선택</label>
                            &ensp;
                            <input type="file" id="profile" style="border: none;">
                            <p>이미지는 60px X 60px 사이즈에 최적화</p>
                            <p>gif, jpg, png파일만 가능하며 용량 5MB 이하만 등록됩니다.</p>
                        </td>
                    </tr>
                    --> 
                    <tr>
                        <th>*관심장르</th>
                        <td colspan="2">
                            <div class="genreList">
                                <div class="genreChk">
                                    <input type="checkbox" id="genre1" name="userGenre" class="userGenre" value="액션">
                                </div>
                                <div class="genreName">
                                    <label for="genre1">액션</label>
                                </div>
                                <div class="genreChk">
                                    <input type="checkbox" id="genre2" name="userGenre" class="userGenre" value="멜로">
                                </div>
                                <div class="genreName">
                                    <label for="genre2">멜로</label>
                                </div>
                                <div class="genreChk">
                                    <input type="checkbox" id="genre3" name="userGenre" class="userGenre" value="공포">
                                </div>
                                <div class="genreName">
                                    <label for="genre3">공포</label>
                                </div>
                                <div class="genreChk">
                                    <input type="checkbox" id="genre4" name="userGenre" class="userGenre" value="코미디">
                                </div>
                                <div class="genreName">
                                    <label for="genre4">코미디</label>
                                </div>
                                <div class="genreChk">
                                    <input type="checkbox" id="genre5" name="userGenre" class="userGenre" value="애니메이션">
                                </div>
                                <div class="genreName">
                                    <label for="genre5">애니메이션</label>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            <br><br>
            <button type="button" class="btn button-gray">취소</button>
            <button type="button" class="btn button-purple" id="btnJoin">회원가입</button>
         </form>
         
         
         <script>

         
         //아이디 중복 및 유효성 검사
         function idCheck() {
        	 
        	 var $idchk = $("#joinUser input[name=userId]");
        	 var regExp = /^[a-z0-9_]{4,15}$/;
        	 
//            	 console.log($idchk.val());
             if(!regExp.test($idchk.val())){
				 $("#idcheck").css("color","red").text("유효하지 않는 아이디입니다. 영소문자, 숫자, _입력가능, 최소 4글자 최대 15글자 입력해주세요.");
				 $("#idcheck").focus();
                 $("#userId").removeClass('chked');
                 return false;
             }else{
        		 $.ajax({
        			 url : "idCheck.me",
					 data : {
						 checkId : $idchk.val()
						 },
					 success : function(result){
			 			 console.log(result);
						 if(result=='NNNNY'){
							 $("#idcheck").css("color","yellowgreen").text("사용가능한 아이디입니다.");
			                 $("#userId").addClass('chked');
						 }else{
							 $("#idcheck").css("color","red").text("사용중이거나 탈퇴한 아이디입니다.");
			                 $("#userId").removeClass('chked');
						 }
					 },
					 error : function(){
						 console.log("ajax 통신 실패");
						 }
				 })
             }
         }
         
         
         //닉네임 중복 및 유효성 검사
         function nicknameCheck() {
        	 
        	 var $nicknamechk = $("#joinUser input[name=userNickname]");
        	 var regExp = /^[가-힣a-zA-Z0-9]{2,6}$/;
        	 
           	 console.log($nicknamechk.val());
             if(!regExp.test($nicknamechk.val())){
				 $("#nicknamecheck").css("color","red").text("유효하지 않는 닉네임입니다. 영문자, 한글, 숫자 입력가능, 최소 2글자 최대 6글자 입력해주세요");
				 $("#nicknamecheck").focus();
                 $("#userNickname").removeClass('chked');
                 return false;
             }else{
        		 $.ajax({
        			 url : "nicknameCheck.me",
					 data : {
						 checkNickname : $nicknamechk.val()
						 },
					 success : function(result){
			 			 console.log(result);
						 if(result=='NNNNY'){
							 $("#nicknamecheck").css("color","yellowgreen").text("사용가능한 닉네임입니다.");
			                 $("#userNickname").addClass('chked');
						 }else{
							 $("#nicknamecheck").css("color","red").text("사용할수 없는 닉네임입니다.");
			                 $("#userNickname").removeClass('chked');
						 }
					 },
					 error : function(){
						 console.log("ajax 통신 실패");
						 }
				 })
             }
         }
         
         
         //비밀번호 일치 및 유효성 검사
	        $(function(){
	        	var $userPwd = $("#joinUser input[name=userPwd]");
	        	var $userPwdChk = $("#joinUser input[name=userPwdChk]");
	        	
		        	$userPwd.keyup(function(){
			        	if($userPwd.val().length>=4){
		        			$.ajax({
							url : "pwdCheck.me",
							data : {
								userPwd : $userPwd.val(),
								userPwdChk : $userPwdChk.val()
							},
							success : function(result){
								console.log(result);
								if(result=='NNNNY'){
									$("#pwdCheck").show();
									$("#pwdCheck").css("color","yellowgreen").text("비밀번호가 일치합니다.");
					                $("#userPwd").addClass('chked');
								}else{
									$("#pwdCheck").show();
									$("#pwdCheck").css("color","red").text("비밀번호가 일치하지 않습니다");
					                $("#userPwd").removeClass('chked');
								}
							},
							error : function(){
								console.log("ajax 통신 실패");
							}
						})
			        	}else{
							$("#pwdCheck").css("color","red").text("비밀번호를 4자리 이상 입력해주세요.");
			                $("#userPwd").removeClass('chked');
			        	}
		        	})
		        	
		        	$userPwdChk.keyup(function(){
			        	if($userPwdChk.val().length>=4){
		        			$.ajax({
							url : "pwdCheck.me",
							data : {
								userPwd : $userPwd.val(),
								userPwdChk : $userPwdChk.val()
							},
							success : function(result){
								console.log(result);
								if(result=='NNNNY'){
									$("#pwdCheck").show();
									$("#pwdCheck").css("color","yellowgreen").text("비밀번호가 일치합니다.");
					                $("#userPwd").addClass('chked');
								}else{
									$("#pwdCheck").show();
									$("#pwdCheck").css("color","red").text("비밀번호가 일치하지 않습니다");
					                $("#userPwd").removeClass('chked');
								}
							},
							error : function(){
								console.log("ajax 통신 실패");
							}
						})
			        	}else{
							$("#pwdCheck").css("color","red").text("비밀번호를 4자리 이상 입력해주세요.");
			                $("#userPwd").removeClass('chked');
			        	}
		        	})
	        	})
         
        //회원가입버튼 클릭시 유효성검사(아이디, 비밀번호, 닉네임)
   		$(document).ready(function(){
   			//이메일용 유효성
   			var regExp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
   			$("#btnJoin").click(function(){
				//필수입력
   				if($("#userId").val()==""){
   					alert("아이디 입력은 필수입니다.");
   					$("#userId").focus();
   				}else if($("#userPwd").val()==""){
   					alert("비밀번호 입력은 필수입니다.");
   					$("#userPwd").focus();
   				}else if($("#userPwdChk").val()==""){
   					alert("비밀번호확인 입력은 필수입니다.");
   					$("#userPwdChk").focus();
   				}else if($("#userName").val()==""){
   					alert("이름 입력은 필수입니다.");
   					$("#userName").focus();
   				}else if($("#userNickname").val()==""){
   					alert("닉네임 입력은 필수입니다.");
   					$("#userNickname").focus();
   				}else if($("#userEmail").val()==""){
   					alert("이메일 입력은 필수입니다.");
   					$("#userEmail").focus();
   				}else if($("#userPhone").val()==""){
   					alert("휴대폰번호 입력은 필수입니다.");
   					$("#userPhone").focus();
   				}else if($("input:checkbox[name='userGenre']").is(":checked")==false){
   					alert("관심있는 장르 적어도 하나를 선택해주세요.");
   					$("#genre1").focus();
   				//중복체크
   				}else if($("#userId").hasClass("chked")==false){
   					alert("아이디 중복체크 해주세요.");
   					$("#userId").focus();
   				}else if($("#userNickname").hasClass("chked")==false){
   					alert("닉네임 중복체크 해주세요.");
   					$("#userNickname").focus();
   				//비밀번호일치
   				}else if($("#userPwd").hasClass("chked")==false){
   					alert("비밀번호가 일치하지 않습니다.");
   					$("#userPwd").focus();
   	   			//메일인증번호일치
   				}else if($("#userEmail").hasClass("chked")==false){
   					alert("메일 인증번호가 일치하지 않습니다.");
   					$("#userEmail").focus();
				//이메일 형식 유효성
   				}else if(!regExp.test($("#userEmail").val())){
   					alert("이메일 형식을 확인해주세요");
   					$("#userEmail").focus();
   				}else{
   					$("#joinUser").submit();
   				}
   			});
   		});
         
	     var code = ""; //이메일 인증번호 변수
         //이메일 인증
         $('#btnSendMailCode').click(function() {
			var email = $('#userEmail').val();
		    var cehckBox = $("#emailCode");
		    var boxWrap = $("#emailCodeBox");
		
			$.ajax({
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		        	cehckBox.attr("disabled",false);
		        	code = data;
 		        	console.log(code); //테스트시 메일확인 번거로울때 콘솔 확인용
		        }
			});
		});
	     
	     //이메일 인증번호 비교
	     $(function(){
	        	var $inputCode = $("#emailCode");
	        	var $checkResult = $("#emailCodeCheck");
	        	
		        	$inputCode.keyup(function(){
			        	if($inputCode.val().length>=1){
		        			$.ajax({
							url : "emailCodeCheck.me",
							data : {
								code : code,
								inputCode : $inputCode.val()
							},
							success : function(result){
								console.log(result);
								if(result=='NNNNY'){
									$("#emailCodeCheck").show();
									$("#emailCodeCheck").css("color","yellowgreen").text("인증번호가 일치합니다.");
					                $("#userEmail").addClass('chked');
								}else{
									$("#emailCodeCheck").show();
									$("#emailCodeCheck").css("color","red").text("인증번호가 일치하지 않습니다");
					                $("#userEmail").removeClass('chked');
								}
							},
							error : function(){
								console.log("ajax 통신 실패");
							}
						})
			        	}else{
							$("#emailCodeCheck").css("color","red").text("발송된 인증번호를 입력해주세요.");
			                $("#userEmail").removeClass('chked');
			        	}
		        	})
	        	})     
			</script>
         
         </div>
        
    </div>
</body>
</html>