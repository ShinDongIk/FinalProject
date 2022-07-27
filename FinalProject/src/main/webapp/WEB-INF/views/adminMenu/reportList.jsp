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
    #content table thead{
        font-size: large;
    }
</style>
</head>

<body>
	<jsp:include page="../common/adminMypage.jsp"/>
    <div id="content" align="center">
        <p>신고 관리</p>
            <select name="" id="" style="display: inline; width: 150px;">
                <option value="">제목</option>
                <option value="">작성자</option>
            </select>
    	<input type="text" style="width: 30%; display: inline;">&nbsp<button>검색</button>
        <br>
        <table class="table table-hover table-bordered" style="width: 60%;">
            <thead>
                <tr>
                	<td align="center"><input type="checkbox" name="allck" id="allck"></td>
                    <th width=10%>No.</th>
                    <th width=25%>신고자</th>
                    <th width=25%>대상</th>
                    <th width=30%>날짜</th>
                    <th width=10%>처리 상태</th>
                </tr>
            </thead>
            <tbody id="tbody">
            <c:forEach var="r" items="${list }">
                <tr>
                	<td align="center" class="ck"><input type="checkbox" name="ckbox" class="ckbox" value="${r.declarationNo }"></td>
                    <td>${r.declarationNo }</td>
                    <td>${r.reporter }</td>
                    <td>${r.reported }</td>
                    <td>${r.reportEnter }</td>
                    <td>${r.reportStatus }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
	        <div style="width: 60%;" align="right">
				<button  type="button" data-toggle="modal" data-target="#myModal2" id="openmd2">삭제</button>
	        </div>
    </div>
	<br><br>
    <div id="paging-area" align="center">
    	<c:choose>
    		<c:when test="${pi.currentPage eq 1 }">
    			<button disabled><</button>
    		</c:when>
    		<c:otherwise>
    			<button onclick="location.href='reportList.ad?cPage=${pi.currentPage - 1}'"><</button>
    		</c:otherwise>
    	</c:choose>
    	
    	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	    	<c:choose>
	    		<c:when test="${pi.currentPage eq p}">
	    			<button disabled>${p }</button>
	    		</c:when>
	    		<c:otherwise>
	    			<button onclick="location.href='reportList.ad?cPage=${p}'" >${p }</button>
	    		</c:otherwise>
	    	</c:choose>
    	</c:forEach>
    	
    	<c:choose>
    		<c:when test="${pi.currentPage eq pi.maxPage }">
    			<button disabled>></button>
    		</c:when>
    		<c:otherwise>
    			<button onclick="location.href='reportList.ad?cPage=${pi.currentPage + 1}'">></button>
    		</c:otherwise>
    	</c:choose>
    </div>
	    <!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="display: none;" id="openmd">
	  </button>
	  
	  <!-- The Modal -->
	  <div class="modal fade" id="myModal">
	    <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	  
	        <!-- Modal Header -->
	        <div class="modal-header" style="height:50px;">
	          <h4 class="modal-title">신고 내역</h4>
	          <button type="button" class="close" data-dismiss="modal" style="height:50px;">&times;</button>
	        </div>
	  
	        <!-- Modal body -->
	        <div class="modal-body">
	          <table>
	            <tr>
	                <th>신고자</th>
	                <td id="rName" colspan="3"></td>
	            </tr>
	            <tr>
	                <th>대상</th>
	                <td id="tName" colspan="3"></td>
	            </tr>
	            <tr>
	                <th>신고 날짜</th>
	                <td id="rDate"></td>
	                <th>처리 여부</th>
	                <td id="rStatus"></td>
	            </tr>
	            <tr>
	                <td>내용</td>
	                <td colspan="3"><textarea name="" id="rContent" cols="30" rows="10" style="resize: none;" readonly>신고</textarea></td>
	            </tr>
	          </table>
	        </div>
	  
	        <!-- Modal footer -->
	        <div class="modal-footer" align="center" style="height: 100px;" id="footer">
	        </div>
	  
	      </div>
	    </div>
	  </div>
	  
	  	    <!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" style="display: none;" id="openmd2">
	  </button>
	  
	  <!-- The Modal -->
	  <div class="modal fade" id="myModal2">
	    <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	  
	        <!-- Modal Header -->
	        <div class="modal-header" style="height:50px;">
	          <button type="button" class="close" data-dismiss="modal" style="height:50px;">&times;</button>
	        </div>
	  
	        <!-- Modal body -->
	        <div class="modal-body moda">
	        </div>
	  
	        <!-- Modal footer -->
	        <div class="modal-footer" align="center" style="height: 100px;">
	            <button id="del">삭제</button>
	            <button data-dismiss="modal">취소</button>
	        </div>
	  
	      </div>
	    </div>
	  </div>
	 
  <br>
    <script>
	    $("#allck").click(function(){
	        if($("#allck").is(":checked")){
	            $(".ckbox").prop("checked",true);
	        }else{
	            $(".ckbox").prop("checked",false);
	        }
	    })
        $("#tbody td").not($(".ck")).click(function(){
            var rNum = $(this).parent().children().eq(1).text();
            $("#openmd").click();
            $.ajax({
            	url : "selectReport.ad",
            	data : {
            		num : rNum
            	},
            	success : function(result){
            		var reported = result.reported
            					 + "<input type='hidden' id='dNo' value='"+result.declarationNo+"'>"
            					 + "<input type='hidden' id='reported' value='"+result.reported+"'>"
            		$("#rName").html(result.reporter);
            		$("#tName").html(reported);
            		$("#rDate").html(result.reportEnter);
            		$("#rContent").html(result.reportContent);
            		$("#rStatus").html(result.reportStatus);
            		if(result.reportStatus!='N'){
            			var btn = "<button type='button' onclick='reportCan();' id='dd'>신고 취소</button>"
        						+ "<button data-dismiss='modal'>닫기</button>";
        				$("#footer").html(btn);
            		}else{
            			var btn = "<button type='button' onclick='reportAccept();' id='ff'>신고 접수</button>"
    							+ "<button data-dismiss='modal'>닫기</button>";
            			$("#footer").html(btn);
            		}
            	},
            	error : function(){
            		console.log("통신실패");
            	}
            })
        })
        
        function reportAccept(){
	    	var dNo = $("#dNo").val();
	    	var reported = $("#reported").val();
	    	$.ajax({
	    		url : "reportAccept.ad",
	    		data : {
	    			dNo : dNo,
	    			reported : reported
	    		},
	    		success : function(result){
	    			alert(result);
	    			window.location.reload(true);
	    		},
	    		error : function(result){
	    			console.log("통신 실패");
	    		}
	    	})
	    }
	    
	    function reportCan(){
	    	var dNo = $("#dNo").val();
	    	var reported = $("#reported").val();
	    	$.ajax({
	    		url : "reportCan.ad",
	    		data : {
	    			dNo : dNo,
	    			reported : reported
	    		},
	    		success : function(result){
	    			alert(result);
	    			window.location.reload(true);
	    		},
	    		error : function(result){
	    			console.log("통신 실패");
	    		}
	    	})
	    }
        
        
        
        
        
        
        
        
        
        
        $("#openmd2").click(function(){
        	var bno=[];
            var count=0;
            var boxNum=$(":input[name=ckbox]")
	        for(var i=0;i<boxNum.length;i++){
	            if(boxNum[i].checked==true){
	                bno[count]=boxNum[i].value;
	                count++;
	            }
	        }
            if(count==0){
            	alert("게시글을 선택하십시오");
				return false;
            }else{
				$(".moda").html("<h3>"+count+"개 게시물을 삭제하시겠습니까?");
		        $("#del").click(function(){
		            $.ajax({
		                url : "deleteReport.ad",
		                data : {
		                	bno : bno
		                },
		                traditional : true,
		                success : function(){
		                	window.location.reload(true);
		                }
		            })
		        })
            }
        })
        
	    
	    
    </script>
</body>
</html>