<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/ottRecomend.css">
<style>
	.nav-link:hover{
		cursor:pointer;
	}
</style>
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		 <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

	<jsp:include page="../common/menubar.jsp"/>
	
	<footer>
	<!-- Products Start -->
	<div class="container-fluid about py-1">
		<div class="container">
			
				<div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
						<h1 class="text-primary font-secondary" style="color: burlywood !important;">Ott & Rank</h1>
						<h6 class="display-42 text-uppercase">Enjoy your life with us!</h6>
				</div>
				<div class="tab-class text-center">
						<ul class="nav nav-tabs d-inline-flex justify-content-center bg-dark text-uppercase border-inner p-4 mb-5" role="tablist">
								<li class="nav-item">

										<a id="pills-kino-tab" class="nav-link active" data-tab="tab1"  style="color: bisque !important;">kino</a>
								</li>
								<li class="nav-item" >
										<a id="pills-netflix-tab" class="nav-link" data-tab="tab2"  style="color: bisque !important;">netflix</a>
								</li>
								<li class="nav-item" >
										<a id="pills-wavve-tab" class="nav-link" data-tab="tab3"  style="color: bisque !important;">wavve</a>
								</li>
								<li class="nav-item" >
									<a id="pills-tving-tab" class="nav-link" data-tab="tab4"  style="color: bisque !important;">tving</a>
							</li>
							<li class="nav-item" >
								<a id="pills-disney-tab" class="nav-link" data-tab="tab5"  style="color: bisque !important;">disney</a>
						</li>
						<li class="nav-item" >
							<a id="pills-watcha-tab" class="nav-link" data-tab="tab6"  style="color: bisque !important;">watcha</a>
					</li>
						</ul>
						<div class="tab-content">
								<div id="kino">
									<div class="row g-3" style="align-items: center;flex-direction: column;">
												<c:forEach var="m" items="${pr }" varStatus="status">
													<div class="col-lg-6" style="max-width:100%; width: 1000px;">
															<div class="d-flex h-100" style="width: 100%;  height: 100px !important;max-height: 100% !important;">
																	<div class="flex-shrink-0">
																			<img class="img-fluid" src="${m.postImg }" alt="" style="width: 100px; height: 100px;">
																			
																	</div>
																	<div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4" style="width: 100%;">
																			<h5 class="text-uppercase"><b>${status.count }</b></h5>
																			<span><b>"${m.postName }"</b></span>
																	</div>
															</div>
													</div>
													</c:forEach>
												
											</div>
									</div>
								
						</div>
				</div>
				<script>
					
	
				
				
				
					$(".nav-link").click(function(){
							
							var num = $(this).text();
							
							$('li.nav-item a').removeClass('active');
							$(this).addClass('active');
							
							$(".tab-content").children().attr('id',num);
							
							console.log(num);
							
							$.ajax({
								url: "ajax.do",
								data : {name :  num},
								success : function(result){
									console.log(result);
									var str = "";
									
									$.each (result, function(i){
										
										str += "<div class='row g-3' style='align-items: center;flex-direction: column;'>" 
											+"<div class='col-lg-6' style='max-width:100%; width: 1000px;'>"
											+"<div class='d-flex h-100' style='width: 100%;  height: 100px !important;max-height: 100% !important;'>"
											+"<div class='flex-shrink-0'>"
											+"<img class='img-fluid' src='"+result[i].PostImg+"' style='width: 100px; height: 100px;'>"
											+"</div>"
											+"<div class='d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4' style='width: 100%;'>"
											+"<h5 class='text-uppercase'><b>"+(i+1)+"</b></h5>"
											+"<span><b>"+result[i].postName+"</b></span>"
											+"</div>"
										+"</div>"
											+"</div>"
											+"</div>"
									});
									
									$("#"+num).html(str);
									
									
								},
								error : function(){
									console.log("ajax 통신 실패");
								}
							})
							
					})
					
							
							
							
							
			
				
				</script>
		</div>
</div>
<!-- Products End -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>



</footer>

</html>