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
	                <th width="10%">정지 여부</th>
	            </tr>
        	</thead>
            <tbody id="tbody">
	            <c:forEach var="m" items="${list }">
		            <tr>
		            	<td>${m.userId }</td>
		                <td>${m.userName }</td>
		                <td>${m.userNickname }</td>
		                <td>${m.userEmail }</td>
		                <td>${m.userPhone }</td>
		                <td>${m.levelName }</td>
		                <td>${m.userStopStatus }</td>
		            </tr>
	            </c:forEach>
            </tbody>
        </table>
    </div>
    <br><br>
    <div id="paging-area" align="center">
    	<c:choose>
    		<c:when test="${pi.currentPage eq 1 }">
    			<button disabled><</button>
    		</c:when>
    		<c:otherwise>
    			<button onclick="location.href='manageList.ad?cPage=${pi.currentPage - 1}'"><</button>
    		</c:otherwise>
    	</c:choose>
    	
    	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	    	<c:choose>
	    		<c:when test="${pi.currentPage eq p}">
	    			<button disabled>${p }</button>
	    		</c:when>
	    		<c:otherwise>
	    			<button onclick="location.href='manageList.ad?cPage=${p}'" >${p }</button>
	    		</c:otherwise>
	    	</c:choose>
    	</c:forEach>
    	
    	<c:choose>
    		<c:when test="${pi.currentPage eq pi.maxPage }">
    			<button disabled>></button>
    		</c:when>
    		<c:otherwise>
    			<button onclick="location.href='manageList.ad?cPage=${pi.currentPage + 1}'">></button>
    		</c:otherwise>
    	</c:choose>
    </div>
	    <!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="display: none;" id="openmd">
	  </button>
	  
	  <!-- The Modal -->
	  <div class="modal fade" id="myModal">
	    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
	      <div class="modal-content">
	  
	        <!-- Modal Header -->
	        <div class="modal-header" style="height:50px;">
	          <h4 class="modal-title"></h4>
	          <button type="button" class="close" data-dismiss="modal" style="height:50px;">&times;</button>
	        </div>
	  
	        <!-- Modal body -->
	        <div class="modal-body" style="height:400px;">
	          <table>
	            <tr>
	                <th>이름</th>
	            </tr>
	            <tr>
	                <td id="name"></td>
	            </tr>
	            <tr>
	                <th>닉네임</th>
	            </tr>
	            <tr>
	                <td id="nick">f</td>
	            </tr>
	            <tr>
	                <th>휴대폰번호</th>
	            </tr>
	            <tr>
	                <td id="phone"></td>
	            </tr>
	            <tr>
	            	<th>등급 점수</th>
	            </tr>
	            <tr>
	                <td id="score"></td>
	            </tr>
	            <tr>
	                <th>가입 날짜</th>
	            </tr>
	            <tr>
	                <td id="enrollDate"></td>
	            </tr>
	            <tr>
	                <th>정지 날짜</th>
	            </tr>
	            <tr>
	                <td id="stopDate"></td>
	            </tr>
	          </table>
	        </div>
	        <!-- Modal footer -->
	        <div class="modal-footer" align="center" style="height: 100px;" id="footer">
	        </div>
	  
	      </div>
	    </div>
	  </div>
    <br>
    
    <script>
        $("#tbody td").click(function(){
        	var id = $(this).parent().children().eq(0).text();
            $("#openmd").click();
            $.ajax({
            	url : "selectUser.ad",
            	data : {
            		userId : id
            	},
            	success : function(result){
            		var name = result.userName+"<input type='hidden' id='Id' value='"+result.userId+"'>";
            		$("#name").html(name);
            		$("#nick").html(result.userNickname);
            		$("#phone").html(result.userPhone);
            		$("#score").html(result.userScore);
            		$("#enrollDate").html(result.userEnterDate);
            		if(result.userStopStatus!='N'){
            			var btn = "<button type='button' onclick='stopCan();' id='dd'>정지 취소</button>"
            					+ "<button data-dismiss='modal'>닫기</button>";
	            		$("#stopDate").html(result.userStopDate);
	            		$("#footer").html(btn);
            		}else{
            			var btn = "<button type='button' onclick='stop();' id='ff'>정지</button>"
        						+ "<button data-dismiss='modal'>닫기</button>";
            			$("#footer").html(btn);
            		}
            	},
            	error : function(){
            		console.log("통신실패");
            	}
            })
        })
        
        function stop(){
        	var id = $("#Id").val();
        	$.ajax({
        		url : "userStop.ad",
        		data : {
        			userId : id
        		},
        		success : function(result){
        			alert(result);
        			window.location.reload(true);
        		},
        		error : function(){
        			console.log("통신실패");
        		}
        	})
        }

        
		function stopCan(){
        	var id = $("#Id").val();
        	$.ajax({
        		url : "userStopCan.ad",
        		data : {
        			userId : id
        		},
        		success : function(result){
        			alert(result);
        			window.location.reload(true);
        		},
        		error : function(){
        			console.log("통신실패");
        		}
        	})
		}			
        
        
    </script>
</body>
</html>