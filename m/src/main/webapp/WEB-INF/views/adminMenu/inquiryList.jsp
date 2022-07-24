<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
    #tbody td{
        list-style-type: none;
    }
    #tbody li:hover{
        cursor: pointer;
    }
</style>
</head>

<body>
	<jsp:include page="../common/adminMypage.jsp"/>
    <div id="content" align="center">
        <p>1:1 문의</p>
            <select name="" id="" style="display: inline; width: 150px;">
                <option value="">제목</option>
                <option value="">작성자</option>
            </select>
    	<input type="text" style="width: 30%; display: inline;">&nbsp<button>검색</button>
        <br>
        <table class="table table-bordered" style="width: 60%;">
            <thead>
                <tr>
                	<td align="center"><input type="checkbox" name="" id="allck"></td>
                    <th width="10%">번호</th>
                    <th width="10%">유형</th>
                    <th width="35%">내용</th>
                    <th width="15%">작성자</th>
                    <th width="10%">날짜</th>
                    <th width="10%">처리 결과</th>
                </tr>
            </thead>
            <tbody id="tbody">
            	<c:forEach var="i" items="${list }">
	                <tr class="title${i }">
	                	<td align="center" class="ck"><input type="checkbox" name="" class="ckbox"></td>
	                    <td>${i.inquiryNo }</td>
	                    <td>${i.inquiryType }</td>
	                    <td>${i.inquiryContent }</td>
	                    <td>${i.inquiryWriter }</td>
	                    <td>${i.createDate }</td>
	                    <td>${i.status }</td>
	                </tr>
            	</c:forEach>
            </tbody>
        </table>
        <div style="width: 60%;" align="right">
        <button>삭제</button>
        </div>
    </div>
	<br><br>
    <div id="paging-area" align="center">
    	<c:choose>
    		<c:when test="${pi.currentPage eq 1 }">
    			<button disabled><</button>
    		</c:when>
    		<c:otherwise>
    			<button onclick="location.href='inquiryList.in?cPage=${pi.currentPage - 1}'"><</button>
    		</c:otherwise>
    	</c:choose>
    	
    	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	    	<c:choose>
	    		<c:when test="${pi.currentPage eq p}">
	    			<button disabled>${p }</button>
	    		</c:when>
	    		<c:otherwise>
	    			<button onclick="location.href='inquiryList.in?cPage=${p}'" >${p }</button>
	    		</c:otherwise>
	    	</c:choose>
    	</c:forEach>
    	
    	<c:choose>
    		<c:when test="${pi.currentPage eq pi.maxPage }">
    			<button disabled>></button>
    		</c:when>
    		<c:otherwise>
    			<button onclick="location.href='inquiryList.in?cPage=${pi.currentPage + 1}'">></button>
    		</c:otherwise>
    	</c:choose>
    </div>
  <br>
  
  <script>
  		$("tbody td").not($(".ck")).click(function(){
			var ino=$(this).parent().children().eq(1).text();
			location.href="inquiryDetail.in?ino="+ino;
	  	})
	  
	  	$("#allck").click(function(){
          	if($("#allck").is(":checked")){
              	$(".ckbox").prop("checked",true);
          	}else{
              	$(".ckbox").prop("checked",false);
          	}
      	})
  
  </script>
  
  
</body>
</html>