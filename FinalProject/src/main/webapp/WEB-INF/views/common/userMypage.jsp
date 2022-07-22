<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .navi{
        list-style-type: none;
        padding: 0px;
        height: 100%;
    }
    .navi>li{
        display: inline-block;
        text-align: center;
        width: 15%;
    }
    .navi a{
        font-size: 25px;
    }
</style>
</head>
<body>
	<c:if test="${not empty alertMsg}">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg"/>	
	</c:if>
	
	<jsp:include page="menubar.jsp"/>
        <div id="navigator" align="center">
            <ul class="navi">
                <li><a href="#">회원관리</a></li>
                <li><a href="#">신고 처리</a></li>
                <li><a href="inquiryUserList.in?userId=${loginUser.userId }">1:1문의</a></li>
                <li><a href="#">관리자 정보 수정</a></li>
            </ul>
            <ul class="navi">
                <li><a href="userNoticeListView.us">공지사항</a></li>
                <li><a href="userFaqList.us">FAQ</a></li>
            </ul>
        </div>
</body>
</html>