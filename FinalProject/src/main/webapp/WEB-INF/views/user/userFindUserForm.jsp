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

<link rel="stylesheet" href="./resources/css/userFindUserFormStyle.css">



   
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    
    <div class="outer">
        <div class="content1">
            <span class="subTitle">
                <b class="font-purple">아이디/비밀번호 </b><b>찾기</b>
            </span>
        </div>
        <br><br>
        <div class="content2">
            <div class="content2-1">
                <div class="contentTitle">
                    <b>아이디 찾기</b>
                </div>
                <div class="inputLogin">
                    <form action="">
                        <table id="inputTable">
                            <tr>
                                <td colspan="2">
                                    <input type="text" placeholder="이름을 입력하세요" style="width: 100%;" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" >
                                    <input type="email" placeholder="이메일을 입력하세요" style="width: 100%;" class="form-control">
                                </td>
                            </tr>
                        </table>
                        <br>
                        <button type="button" class="btn button-purple">아이디 조회</button> <br><br>
                    </form>
                </div>
            </div>

            <div class="content2-1">
                <div class="contentTitle">
                    <b>비밀번호 찾기</b>
                </div>
                <div class="inputLogin">
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
                        <button type="submit" class="btn button-purple" id="btnFindPwd">임시비밀번호 발송</button> <br><br>
                    </form>
				  	<script>
// 				  	var openWin;
				  	
// 				  	function openChild(){
// 			            // window.name = "부모창 이름"; 
// 			            window.name = "parentForm";
// 			            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
// 			            openWin = window.open("findPwd.me", "childForm", "width=570, height=350, resizable = no, scrollbars = no");
// 			            }
				  	</script>
                </div>
            </div>
    	</div>
   	</div>
</body>
</html>