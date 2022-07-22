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
    .ckbox, #allck{
        width: 15px;
        height: 15px;
    }
</style>
</head>

<body>
<c:if test="${loginUser.userId == 'admin' }">
	<jsp:include page="../common/adminMypage.jsp"/>
    <div id="content" align="center">
        <p>공지사항</p>
        <form action="searchFaq.ad">
            <select name="scitem" id="" style="display: inline; width: 150px;">
                <option value="1">제목 </option>
                <option value="2">내용</option>
            </select>
			<input type="text" style="width: 30%; display: inline;" name="search">&nbsp
			<button type="submmit">검색</button>
		</form>
        <br>
        <table class="table table-hover table-bordered" style="width: 60%;">
            <thead>
                <tr>
                    <td align="center"><input type="checkbox" name="allck" id="allck"></td>
                    <th width=10%>No.</th>
                    <th width=50%>제목</th>
                    <th width=10%>작성자</th>
                    <th width=10%>날짜</th>
                    <th width=10%>조회수</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="b" items="${list }">
            	<tr>
                    <td align="center" class="ck"><input type="checkbox" name="ckbox" class="ckbox" value="${b.boardNo }"></td>
                    <td>${b.boardNo}</td>
                    <td>${b.boardTitle }</td>
                    <td>${b.boardWriter }</td>
                    <td>${b.createDate }</td>
                    <td>${b.count }</td>
                </tr>
            	</c:forEach>
            </tbody>
        </table>
	        <div style="width: 60%;" align="right">
				<button onclick="location.href='faqEnrollForm.ad'">작성</button>
				<button  type="button" data-toggle="modal" data-target="#myModal" id="openmd">삭제</button>
	        </div>
    </div>
	<br><br>
    <div id="paging-area" align="center">
    	<c:choose>
    		<c:when test="${pi.currentPage eq 1 }">
    			<button disabled><</button>
    		</c:when>
    		<c:otherwise>
    			<button onclick="location.href='faqList.ad?cPage=${pi.currentPage - 1}'"><</button>
    		</c:otherwise>
    	</c:choose>
    	
    	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	    	<c:choose>
	    		<c:when test="${pi.currentPage eq p}">
	    			<button disabled>${p }</button>
	    		</c:when>
	    		<c:otherwise>
	    			<button onclick="location.href='faqList.ad?cPage=${p}'" >${p }</button>
	    		</c:otherwise>
	    	</c:choose>
    	</c:forEach>
    	
    	<c:choose>
    		<c:when test="${pi.currentPage eq pi.maxPage }">
    			<button disabled>></button>
    		</c:when>
    		<c:otherwise>
    			<button onclick="location.href='faqList.ad?cPage=${pi.currentPage + 1}'">></button>
    		</c:otherwise>
    	</c:choose>
    </div>
    <br>
    
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
		        </div>
		  
		        <!-- Modal footer -->
		        <div class="modal-footer" align="center" style="height: 100px;">
		            <button id="del">삭제</button>
		            <button data-dismiss="modal">취소</button>
		            <button data-dismiss="modal" style="display:none;" id="cancel"></button>
		        </div>
		  
		      </div>
		    </div>
		  </div>
    </c:if>
    <script>

        $("tbody td").not($(".ck")).click(function(){
	      	var bno=$(this).parent().children().eq(1).text();
            location.href="faqDetailView.ad?bno="+bno;
        })

        $("#allck").click(function(){
            if($("#allck").is(":checked")){
                $(".ckbox").prop("checked",true);
            }else{
                $(".ckbox").prop("checked",false);
            }
        })
	        $("#openmd").click(function(){
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
					$(".modal-body").html("<h3>"+count+"개 게시물을 삭제하시겠습니까?");
			        $("#del").click(function(){
			            $.ajax({
			                url : "deleteFaq.ad",
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