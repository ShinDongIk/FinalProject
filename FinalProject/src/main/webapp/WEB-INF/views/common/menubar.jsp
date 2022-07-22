<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Future Imperfect by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		 
		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body class="is-preload">
		<c:if test="${not empty alertMsg}">
			<script>
				alert("${alertMsg}");
			</script>
			<c:remove var="alertMsg"/>
		</c:if>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="${pageContext.request.contextPath}">ENJOY OTT</a></h1>
						<nav class="links">
							<c:choose>
	                			<c:when test="${ empty loginUser }">
		               			 <!-- 로그인 전 -->
								<ul>
									<li><a href="loginForm.me">로그인</a></li>
									<li><a href="joinTosForm.me">회원가입</a></li>
								</ul>
								</c:when>
								<c:otherwise>
									<!-- 로그인 후 -->
									<ul>
										<li><a href="logout.me">로그아웃</a></li>
										<li><a id="nickName" onClick="memModalOpen();">${ loginUser.userName }님 !</a><a id="nickNeText">환영합니다!</a></li>
										<li><a href="#">등급: ${ loginUser.levelName }</a></li>
										<c:choose>
											<c:when test="${loginUser.userId=='admin' }">
												<li><a href="adminMypage.ad">마이페이지</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="userMypage.us">마이페이지</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</c:otherwise>                
                			</c:choose>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
						<!--  
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>
						-->
						<!-- Links -->
							<section>
								<ul class="links">
									<li><a href="${pageContext.request.contextPath}">홈으로</li>
									<li><a href="">파티원 모여라!</a></li>
									<li><a href="">테마별 작품 정보</a></li>
									<li><a href="watch.ra">OTT별 가격정보</a></li>
									<li><a href="#">OTT별 인기순위</a></li>
									<li>
										<span class="opener">여기는 고객센터!</span>
										<br><br>
										<ul>
											<c:choose>
												<c:when test="${loginUser.userId=='admin' }">
													<li class="list-Style-None"><a href="adminNoticeListView.ad">공지 합니다!</a></li>
													<li class="list-Style-None"><a href="faqList.ad">자주 묻는 질문들이에요!</a></li>
													<li class="list-Style-None"><a href="inquiryAdminList.in">문의 하고 싶어요!!</a></li>
												</c:when>
												<c:otherwise>
													<li class="list-Style-None"><a href="userNoticeListView.us">공지 합니다!</a></li>
													<li class="list-Style-None"><a href="userFaqList.us">자주 묻는 질문들이에요!</a></li>
													<li class="list-Style-None"><a href="inquiryUserList.in?userId=${loginUser.userId }">문의 하고 싶어요!!</a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</li>
								</ul>
							</section>

					</section>

			</div>
			
			<jsp:include page="memberModal.jsp"/>
			
		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/js/main.js"></script>

	</body>
</html>