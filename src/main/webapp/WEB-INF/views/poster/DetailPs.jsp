<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>작품 상세 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

		    <!-- Favicon -->
				<link href="img/favicon.ico" rel="icon">

				<!-- Google Web Fonts -->
				<link rel="preconnect" href="https://fonts.googleapis.com">
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
				<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Oswald:wght@500;600;700&family=Pacifico&display=swap" rel="stylesheet"> 
				<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
				 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
				 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="./resources/css/" />
		<link rel="stylesheet" href="./resources/css/cakebootstrap.min.css">
		<link rel="stylesheet" href="./resources/css/cakestyle.css">
		<link rel="stylesheet" href="./resources/css/owl.carousel.min.css">	
		 <link rel="stylesheet" href="./resources/css/recomReview.css">
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	</head>
	
		<jsp:include page="../common/menubar.jsp"/>
		
<footer>
	<!-- About Start -->
	<div class="container-fluid pt-5">
		<div class="container">
				
				<div class="row gx-5">
						<div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
								<div class="position-relative h-100">
										<img class="position-absolute w-100 h-100" src="${pst.postImg }" style="object-fit: cover;">
								</div>
						</div>
						<div class="col-lg-6 pb-5">
								<h4 class="mb-4">작품 내용</h4>
								<p class="mb-4" style="font-weight: 200; font-family: 'Courier New', Courier, monospace;font-size: small;">${pst.postDes }</p>
								<div class="row g-5">
										<c:forEach var="m" items="${ ottkind}">
										
										<div class="col-sm-4">
												<div class="d-flex align-items-center justify-content-center bg-dark" style="width: 50px; height: 50px;">
														<i class="fa fa-heartbeat fa-2x text-white"></i>
												</div>
												<h4 class="text-uppercase">${m }</h4>
												
										</div>
										</c:forEach>
										
										
								</div>
						</div>
				</div>
		</div>
</div>
<!-- About End -->

<br><br><br><br>
<!-- Facts Start -->
<div class="container-fluid bg-img py-1 mb-5">
		<div class="container py-5">
				<div class="row gx-5 gy-4">
						<div class="col-lg-3 col-md-6">
								<div class="d-flex">
										<div class="bg-warning border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; border-radius: 1rem;">
											<span class="material-symbols-outlined">
												thumb_up
												</span>
										</div>
										<div class="ps-4">
												<h6 class="text-warning text-uppercase">like</h6>
												
										</div>
								</div>
						</div>
						<div class="col-lg-3 col-md-6">
								<div class="d-flex">
										<div class="bg-warning border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; border-radius: 1rem;">
											<span class="material-symbols-outlined">
												done
												</span>
										</div>
										<div class="ps-4">
												<h6 class="text-warning text-uppercase">봤어요</h6>
												
										</div>
								</div>
						</div>
						<div class="col-lg-3 col-md-6">
								<div class="d-flex">
										<div class="bg-warning border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; border-radius: 1rem;">
											<span class="material-symbols-outlined">
												favorite
												</span>
										</div>
										<div class="ps-4">
												<h6 class="text-warning text-uppercase">찜하기</h6>
												
										</div>
								</div>
						</div>
						<div class="col-lg-3 col-md-6">
								<div class="d-flex">
										<div class="bg-warning border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px; border-radius: 1rem;">
											<span class="material-symbols-outlined">
												rate_review
												</span>
										</div>
										<div class="ps-2">
												<h6 class="text-warning text-uppercase">review</h6>
												
										</div>
								</div>
						</div>
				</div>
		</div>
</div>
<!-- Facts End -->
<div class="container-fluid contact position-relative px-5" >
	<div class="container">
			
			<div class="row justify-content-center">
					<div class="col-lg-6">
							<form>
									<div class="row g-3" style="border: 1px solid black;">
											<div class="col-sm-6" style="border: 1px solid black;">
													<p>작성자</p>
											</div>
											<div class="col-sm-6" style="border: 1px solid black;">
													<p>작성시간</p>
											</div>
											<div class="col-sm-12" style="border: 1px solid black;">
													<p>작성 제목</p>
											</div>
											<div class="col-sm-12" style="border: 1px solid black;">
													<p>작성 내용</p>
											</div>
											<div class="col-sm-12" >
													<p align=center style="max-width: 200px; width: 200px; margin: auto;"><a href="">댓글달기</a></p>
											</div>
									</div>
							</form>
					</div>
			</div>
	</div>
</div>
</footer>

<a id="create-kakaotalk-sharing-btn" href="javascript:;">
  <img
    src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
    alt="카카오톡 공유 보내기 버튼"
  />
</a>
<script type="text/javascript">
  Kakao.Share.createDefaultButton({
    container: '#create-kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: '딸기 치즈 케익',
      description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
      imageUrl:
        'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
      link: {
        mobileWebUrl: 'https://developers.kakao.com',
        webUrl: 'https://developers.kakao.com',
      },
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      {
        title: '앱으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
    ],
  })
</script>




</html>