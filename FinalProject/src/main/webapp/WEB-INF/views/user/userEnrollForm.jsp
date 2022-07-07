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
            <form action="join.me" method="post" id="enrollForm">
                <table class="joinTable" align="center">
                    <tr>
                        <th width="20%">*아이디</th>
                        <td>
                            <input type="text" class="form-control harfUpInput" name="userId" required>
                        </td>
                        <td>
                            <div id="idcheck"></div>
                        </td>
                    </tr>
                    <tr>
                    	<th></th>
                        <td colspan="2" class="font-info">
                        영문자, 숫자, _입력가능, 최소 4글자 입력해주세요
                        </td>
                    </tr>
                    <tr>
                        <th>*비밀번호</th>
                        <td>
                            <input type="password" class="form-control harfUpInput" name="userPwd" id="userPwd" required>
                        </td>
                    </tr>
                    <tr>
                        <th>*비밀번호 확인</th>
                        <td>
                            <input type="password" class="form-control harfUpInput" name="userPwd2" id="userPwd2" required>
                        </td>
                    </tr>
                    <tr>
                    	<th></th>
                        <td colspan="2" class="font-info">
                        	비밀번호가 일치합니다
                        	<div id="pwdCheck"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>*이름</th>
                        <td><input type="text" class="form-control harfUpInput" name="userName" required></td>
                    </tr>
                    <tr>
                        <th>*닉네임</th>
                        <td>
                            <input type="text" class="form-control harfUpInput" name="userNickname" required>
                        </td>
                        <td>
                            <div id="nicknamecheck"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>*이메일</th>
                        <td>
                            <input type="email" class="form-control harfUpInput" name="userEmail" required>
                        </td>
                        <td>
                            <button class="button-clear">인증코드 발송</button>
                        </td>
                    </tr>
                    <tr>
                        <th>*인증코드</th>
                        <td><input type="text" class="form-control harfUpInput" required></td>
                    </tr>
                    <tr>
                        <!-- 하이픈형식 000-0000-0000 -->
                        <th>*휴대폰 번호</th>
                    <td><input type="text" class="form-control harfUpInput" name="userPhone" required></td>
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
                        <th>관심장르</th>
                        <td colspan="2">
                            <div class="genreList">
                                <div class="genreChk">
                                    <input type="checkbox" id="genre1" name="userGenre" value="액션">
                                </div>
                                <div class="genreName">
                                    <label for="genre1">액션</label>
                                </div>
                                <div class="genreChk">
                                    <input type="checkbox" id="genre2" name="userGenre" value="멜로">
                                </div>
                                <div class="genreName">
                                    <label for="genre2">멜로</label>
                                </div>
                                <div class="genreChk">
                                    <input type="checkbox" id="genre3" name="userGenre" value="공포">
                                </div>
                                <div class="genreName">
                                    <label for="genre3">공포</label>
                                </div>
                                <div class="genreChk">
                                    <input type="checkbox" id="genre4" name="userGenre" value="코미디">
                                </div>
                                <div class="genreName">
                                    <label for="genre4">코미디</label>
                                </div>
                                <div class="genreChk">
                                    <input type="checkbox" id="genre5" name="userGenre" value="애니메이션">
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
            <button type="button" class="btn button-purple" onclick="return validate();">회원가입</button>
         </form>
         
         
         <script>
         //아이디, 닉네임 중복검사
	        $(function(){
	        	let $idchk = $("#enrollForm input[name=userId]");
	        	
		        	$idchk.keyup(function(){
			        	if($idchk.val().length>=4){
		        			$.ajax({
							url : "idCheck.me",
							data : {
								checkId : $idchk.val()
							},
							success : function(result){
								console.log(result);
								if(result=='NNNNY'){
									$("#idcheck").show();
									$("#idcheck").css("color","yellowgreen").text("사용가능한 아이디입니다.");
									$("#enrollForm:submit").attr("disabled",false);
								}else{
									$("#idcheck").show();
									$("#idcheck").css("color","red").text("사용중이거나 탈퇴한 아이디입니다.");
									$("#enrollForm:submit").attr("disabled",true);
								}
							},
							error : function(){
								console.log("ajax 통신 실패");
							}
						})
		        	}else{
		        		$("#idcheck").hide();
						$("#enrollForm:submit").attr("disabled",true);
		        	}
	        	})
	        })
	        
	        $(function(){
	        	let $nicknamechk = $("#enrollForm input[name=userNickname]");
	        	
		        	$nicknamechk.keyup(function(){
			        	if($nicknamechk.val().length>=1){
		        			$.ajax({
							url : "nicknameCheck.me",
							data : {
								checkNickname : $nicknamechk.val()
							},
							success : function(result){
								console.log(result);
								if(result=='NNNNY'){
									$("#nicknamecheck").show();
									$("#nicknamecheck").css("color","yellowgreen").text("사용가능한 닉네임입니다.");
									$("#enrollForm:submit").attr("disabled",false);
								}else{
									$("#nicknamecheck").show();
									$("#nicknamecheck").css("color","red").text("사용할수 없는 닉네임입니다.");
									$("#enrollForm:submit").attr("disabled",true);
								}
							},
							error : function(){
								console.log("ajax 통신 실패");
							}
						})
		        	}else{
		        		$("#nicknamecheck").hide();
						$("#enrollForm:submit").attr("disabled",true);
		        	}
	        	})
	        })
	        
	        
	        //비밀번호 유효성 및 일치여부 확인
	        
	        // 유효성 검사

			</script>
         
         </div>
        
    </div>
</body>
</html>