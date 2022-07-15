<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="./resources/css/partyListStyle.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
    <div class="outer">
        <div class="partyMenuArea">
            <nav class="navbar navbar-expand-sm fixed-top" id="partyMenu">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">통합</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">넷플릭스</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">웨이브</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">티빙</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">디즈니+</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">왓챠</a>
                    </li>
                </ul>
            </nav>
        </div>
        
        <div class="newParty">
        	<a href="partyenrollForm.pa" style="float:right">신규파티등록</a>
        </div>
        
        <div class="items">
        	<c:choose>
        		<c:when test="${empty list}">
        			등록된 파티가 없습니다.
        		</c:when>
        		<c:otherwise>
		            <c:forEach var="p" items="${list}">
			            <div class="itemRow">
			                <div class="itemType">
			                    ${ p.ottKor }
			                </div>
			                <div class="itemSeller" style="float: right;">
			                    <span class="userLevel" style="color:rgb(64, 179, 192)">${ p.levelName }</span><br>
			                    <span>${ p.userNickname }</span> 
			                </div>
			                    <div class="itemDate">
			                        ${ p.partyEndDate }까지(<b>11</b>일)
			                    </div>
			                    <div class="itemPrice" style="float: right;">
			                        <span>9,100</span>원
			                    </div>
			                <div class="itemMembers">
			                    <span class="material-symbols-outlined" style="color: #a8b0ff;">person</span>
			                    <span class="material-symbols-outlined" style="color: #a8b0ff;">person</span>
			                    <span class="material-symbols-outlined" style="color: gray;">person</span>
			                    <span class="material-symbols-outlined" style="color: gray;">person</span>
			                    <span class="material-symbols-outlined" style="color: gray;">person</span>
			                </div>
			                <div class="itemJoin" style="float: right;">
			                    <button type="button" class="button-deepPurple">파티가입</button>
			                </div>
			            </div>
		            </c:forEach>
        		</c:otherwise>
            </c:choose>
        
    </div>
        
    </div>
</body>
</html>