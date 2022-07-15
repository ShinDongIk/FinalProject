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

<link rel="stylesheet" href="./resources/css/userLoginFormStyle.css">


</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    
    <div class="outer">
        <div class="subTitle">
            <b style="color: #a9b0ff; font-size: 26px;">로그인</b>
        </div>
        <br><br>
        <div class="subTitle">
            <h6>ENJOY OTT</h6>
        </div>
        <div class="inputLogin">
	        <form action="login.me" method="post" >
                <table id="inputTable">
                    <tr style="height: 20%;">
                        <td width="50%"><a href="joinTosForm.me">회원가입</a></td>
                        <td width="50%"><a href="findUserForm.me">아이디/비밀번호찾기</a></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 100%;">
                            <input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요" style="width: 100%;" class="form-control">
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2" >
                            <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요" style="width: 100%;" class="form-control">
                        </td>
                        <td></td>
                    </tr>
<!--                     <tr> -->
<!--                         <td colspan="2" style="text-align: left;"> -->
<!--                             <input type="checkbox" id="autoLogin"> <label for="autoLogin"> 자동로그인</label> -->
<!--                         </td> -->
<!--                     </tr> -->
                </table>
	            <br>
	            
			    <button type="submit" class="btn button-purple" >로그인</button> <br><br>    	
	        </form>
        </div>
        <div class="subTitle">
            <h6>SNS</h6>
        </div>
        <br>
        <div>

        <br><br><br>
        
    </div>
</body>
</html>