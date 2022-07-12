<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form - FantacyDesigns</title>
    <link rel="stylesheet" href="/m/resources/css/login.css" />
</head>

<body>
	
	<jsp:include page="sidebar.jsp"/>

	    <div class="con">
		    <div class="box">
		        <h1>로그인</h1>
		        <form action="post" class="login-form">
		            <input type="text" name="userId" placeholder="아이디를 입력해주세요!" required><br>
		            <input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요!!"required><br>
		            <input type="button" name="loginBtn" value="로그인" class="btn" style="margin-right: 120px">
		            <a id="memJoin" href="">회원가입</a>
		        </form>
			</div>
		</div>
	


 		
</body>
</html>	