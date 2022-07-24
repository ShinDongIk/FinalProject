<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <p>회원관리</p>
        <table class="table table-bordered" style="width: 60%;">
        	<thead>
	            <tr>
	                <th width="10%">아이디</th>
	                <th width="10%">이름</th>
	                <th width="10%">닉네임</th>
	                <th width="30%">이메일</th>
	                <th width="15%">휴대폰 번호</th>
	                <th width="10%">등급</th>
	                <th width="10%">신고회수</th>
	            </tr>
        	</thead>
            <tbody>
	            <c:forEach var="i" begin="1" end="10">
		            <tr>
		            	<td>아이디${i }</td>
		                <td>이름${i }</td>
		                <td>멤버${i }</td>
		                <td>naver@naver.com${i }</td>
		                <td>010-2222-3333</td>
		                <td>브론즈</td>
		                <td style="padding: 1px;" align="center"><button class="btn-warning">정지</button></td>
		            </tr>
	            </c:forEach>
            </tbody>
        </table>
    </div>
    <br><br>
    <div id="paging-area" align="center">
        <button><</button>
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>5</button>
        <button>></button>
    </div>
    <br>
</body>
</html>