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
    .ckbox, #allck{
        width: 15px;
        height: 15px;
    }
</style>
</head>

<body>
	<jsp:include page="../common/menubar.jsp"/>
    <div id="content" align="center">
        <p>공지사항</p>
            <select name="" id="" style="display: inline; width: 150px;">
                <option value="">제목</option>
                <option value="">작성자</option>
            </select>
    	<input type="text" style="width: 30%; display: inline;">&nbsp<button>검색</button>
        <br>
        <table class="table table-hover table-bordered" style="width: 60%;">
            <thead>
                <tr>
                    <th width=10%>No.</th>
                    <th width=50%>제목</th>
                    <th width=10%>작성자</th>
                    <th width=10%>날짜</th>
                    <th width=10%>조회수</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="i" begin="1" end="10">
                    <td>${i}</td>
                    <td>제목${i }</td>
                    <td>작성자${i }</td>
                    <td>지금${i }</td>
                    <td>1</td>
                </tr>
            	</c:forEach>
            </tbody>
        </table>
        <div style="width: 60%;" align="right">
        </div>
    </div>
	<br><br>
    <div id="paging-area" align="center">
        <button><</button>
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>5</button>
        <button>></button>
    </div>
    <br>
    
    <script>

	    $("tbody td").click(function(){
	        location.href="noticeDetailView.no";
	    })

    </script>
    
    
    
</body>
</html>