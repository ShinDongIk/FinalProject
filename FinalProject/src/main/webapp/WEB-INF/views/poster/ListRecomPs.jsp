<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Future Imperfect by HTML5 UP</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<link rel="stylesheet" href="./resources/css/list_styles.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script>
        Kakao.init('222cc76469766abca50e2789448c7366');
        Kakao.isInitialized();
        </script>
	</head>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	<footer>
		<!-- Header-->
    <header class="bg-dark py-1">
        <div class="container px-3 px-lg-4 my-4">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder" style="color:bisque;">selected kind list</h1>
                <p class="lead fw-normal text-white-50 mb-0" style="color:bisque;">Enjoy your life with us!</p>
            </div>
        </div>
    </header>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            	<c:forEach var="m" items="${pst }">
                <div class="col mb-5" style="margin-bottom: 0 !important;">
                    <div class="card h-100" style="height: 50% !important;">
                        <!-- Product image-->
                        <a href="detail.ps?postNo=${m.postNo }"><img class="card-img-top" src="${m.postImg }" alt="..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <span class="fw-bolder" style="font-weight: 500;font-size: 15px;">${m.postName }</span>
                            </div>
                        </div>
                       	 	<div class="card-footer p-4 pt-0 border-top-0 bg-transparent" style="margin-top: auto;">
                        <!-- Product actions-->
                        <c:choose>
                        	<c:when test="${ not empty loginUser }">
	                            <div class="text-center2" style="position: relative;">
	                            <a class="btn btn-outline-dark mt-auto" onclick="good('${m.postNo}','${loginUser.userId }')">
	                            <span class="material-symbols-outlined" style="border:0px;">
	                            thumb_up
	                            </span>
	                            </a>
	                            </div>
                        	
                       		</c:when>
                       		<c:otherwise>
	                            <div class="text-center2" style="position: relative;">
	                            <a class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#myModal">
	                            <span class="material-symbols-outlined" style="border:0px;">
	                            thumb_up
	                            </span>
	                            </a>
                        		</div>
                       		</c:otherwise>
                        </c:choose>
                            <div class="text-center2">
                            <a class="btn btn-outline-dark mt-auto" id="kakaotalk-sharing-btn" href="javascript:shareMessage('${m.postImg }','${m.postName }')">
                            <span class="material-symbols-outlined">
                                share
                            </span>
                            </a>
                            </div>
                        </div>
                            
                        </div>
                        
                    </div>
                </c:forEach>
                </div>
                
                </div>
                </section>
                
                <!-- The Modal -->
			  <div class="modal fade" id="myModal">
			    <div class="modal-dialog">
			      <div class="modal-content" style="top:300px;">
			        <!-- Modal body -->
			        <div class="modal-body">
			          <h3 class="modal-content" style="text-align:center; font-size:15px">로그인 후 이용해주세요.</h3>
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			        </div>
			        
			      </div>
			    </div>
			  </div>
        
    
	</footer>
	
				<script type="text/javascript">
					  function shareMessage(s,t) {
					    Kakao.Share.sendDefault({
					      objectType: 'feed',
					      content: {
					        title: t,
					        description: '#OTT#RECOMMEND',
					        imageUrl:
					           s,
					        link: {
					          mobileWebUrl: 'http://localhost:8887/spring/recomend.ps',
					          webUrl: 'http://localhost:8887/spring/recomend.ps',
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
					            mobileWebUrl: 'http://localhost:8887/spring/recomend.ps',
					            webUrl: 'http://localhost:8887/spring/recomend.ps',
					          },
					        },
					        {
					          title: '앱으로 보기',
					          link: {
					            mobileWebUrl: 'http://localhost:8887/spring/recomend.ps',
					            webUrl: 'http://localhost:8887/spring/recomend.ps',
					          },
					        },
					      ],
					    })
					  }
					</script>
					
					
				 	<script type="text/javascript">
                        		
					
					
                        			
                        			function good(postNo,userId){
                                		
                            			$.ajax({
                            				url:"good.do",
                            				data:{postNo: postNo,
                            					  userId:userId},
                            				success: function(){
                            					$("#good").css("background-color", "#0dcaf0");
                            				},
                            				error :function(){
                            					console.log("통신 실패");
                            					
                            				}
                            				})
                            			}
                        			
                        		$(function(){
                        		
                        			$.ajax({
                        				url:"selectUser.do",
                        				data:{
                        					userId:'${loginUser.userId}',
                        					pst:'${pst}'
                        					},
                        				success: function(result){
                        					if(result>0){
                        						console.log("success");
                        					$("#good").css("background-color", "#0dcaf0");
                        					}else{
                        						console.log("failed");
                        						$("#good").css("background-color", "white");
                        					}
                        				},
                        				error :function(){
                        					console.log("통신 실패");
                        					
                        				}
                        				})
                        			})

                        	</script>
                        	
                 
					


	</html>