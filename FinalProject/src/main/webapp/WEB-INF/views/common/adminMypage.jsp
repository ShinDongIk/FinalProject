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
                <li><a href="manageList.ad">회원관리</a></li>
                <li><a href="reportList.ad">신고 처리</a></li>
                <li><a href="inquiryAdminList.in">1:1문의</a></li>
                <li><a href="adminUpdate.ad">관리자 정보 수정</a></li>
            </ul>
            <ul class="navi">
                <li><a href="adminNoticeListView.ad">공지사항</a></li>
                <li><a href="faqList.ad">FAQ</a></li>
            </ul>
        </div>
</body>
</html>