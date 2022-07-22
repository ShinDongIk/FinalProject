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
	<jsp:include page="../common/adminMypage.jsp"/>
    <div id="content" align="center">
        <p>관리자 정보 수정</p>
        <form action="adminUpdateComple">
            <table class="table">
                <tr>
                    <td width="30%">관리자 아이디 : </td>
                    <td width="70%"><input type="text" name="" id=""></td>
                </tr>
                <tr>
                    <td>관리자 비밀번호</td>
                    <td><input type="password" name="" id=""></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="" id=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button class="btn-danger" style="font-size: 12px;">변경</button>
                        <button type="reset" style="font-size: 12px;">취소</button>
                    </td>
                </tr>
            </table>
        </form>



    </div>
    
	
    
</body>
</html>