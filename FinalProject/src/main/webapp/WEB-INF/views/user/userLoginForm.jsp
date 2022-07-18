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

<jsp:include page="../common/menubar.jsp" />

<link rel="stylesheet" href="./resources/css/userLoginFormStyle.css">

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>
    
    
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
        
        <div>
        	<!-- 네이버 로그인 버튼 노출 영역 -->
			<div id="naver_id_login"></div>

			<script type="text/javascript">
				var naver_id_login = new naver_id_login("NCz5WpwISNnKiY_jFa8I", "http://localhost:8886/enjoyforott/naverlogincallback.me");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("white", 3, 50);
				naver_id_login.setDomain("http://localhost:8886/enjoyforott");
				naver_id_login.setState(state);
				naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			</script>
        </div>
        
    	<br>
	</div>

</body>
</html>