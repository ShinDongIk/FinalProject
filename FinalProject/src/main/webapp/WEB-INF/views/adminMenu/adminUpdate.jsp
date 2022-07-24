<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
    #content table{
        width: 50%;
        vertical-align: auto;
    }
</style>
</head>
<body>
<c:if test="${loginUser.userId == 'admin' }">
	<jsp:include page="../common/adminMypage.jsp"/>
    <div id="content" align="center">
        <p>관리자 비밀번호 변경</p>
        <form action="adminInfoUpdate.ad" method="post" id="updateForm">
            <table class="table">
            	<tr>
            		<td>기존 비밀번호</td>
            		<td><input type="password" name="adminPwd" id="adminPwd"></td>
            		<input type="hidden" name="userId" value="${loginUser.userId }">
            	</tr>
                <tr>
                    <th></th>
                    <td colspan="2" class="font-info">
                        <div id="adminPwdchk">
                    	</div>
                    </td>
                </tr>
                <tr>
                    <td>변경 비밀번호</td>
                    <td><input type="password" name="userPwd" id="userPwd"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="userPwdChk" id="userPwdChk"></td>
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
                    <td colspan="2" align="center">
                        <button type="button" id="up" class="btn-danger" style="font-size: 12px;">변경</button>
                        <button type="reset" style="font-size: 12px;">취소</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </c:if>
    <script>
    $(function(){
    	var adminPwd = $("#updateForm input[name=adminPwd]");
    	var adminId = $("#updateForm input[name=userId]");
    	var $userPwd = $("#updateForm input[name=userPwd]");
    	var $userPwdChk = $("#updateForm input[name=userPwdChk]");
    	
    	adminPwd.keyup(function(){
    		if(adminPwd.val().length>=4){
	    		$.ajax({
	    			url : "checkPwd.ad",
	    			data : {
	    				userPwd : adminPwd.val(),
	    				userId : adminId.val()
	    			},
	    			success : function(result){
						if(result=='NNNNY'){
							$("#adminPwdchk").css("color","yellowgreen").text("비밀번호가 일치합니다.");
			                $("#adminPwd").addClass('chked');
						}else{
							$("#adminPwdchk").css("color","red").text("비밀번호가 일치하지 않습니다");
			                $("#adminPwd").removeClass('chked');
						}
	    			}
	    		})
    		}else{
				$("#adminPwdchk").css("color","red").text("비밀번호를 4자리 이상 입력해주세요.");
                $("#adminPwd").removeClass('chked');
        	}
    	})
        	$userPwd.keyup(function(){
	        	if($userPwd.val().length>=4){
        			$.ajax({
					url : "pwdCheck.me",
					data : {
						userPwd : $userPwd.val(),
						userPwdChk : $userPwdChk.val()
					},
					success : function(result){
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
        	
        	$("#up").click(function(){
        		if($("#adminPwd").hasClass("chked")==false){
   					alert("비밀번호가 일치하지 않습니다.");
   					$("#adminPwd").focus();
        		}
        		else if($("#userPwd").hasClass("chked")==false){
   					alert("비밀번호가 일치하지 않습니다.");
   					$("#userPwd").focus();
        		}else{
        			$("#updateForm").submit();
        		}
        	})
        	
        	
        	
        	
        	
        	
    	})
    
    
    
    
    
    
    
    </script>
    
    
	
    
</body>
</html>