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
                    <th width=10%>No.</th>
                    <th width=40%>제목</th>
                    <th width=20%>작성자</th>
                    <th width=10%>날짜</th>
                    <th width=10%>조회수</th>
                    <th width=10%>처리 상태</th>
                </tr>
            </thead>
            <tbody id="tbody">
            <c:forEach var="i" begin="1" end="10">
                <tr>
                    <td>${i }</td>
                    <td>신고제목${i }</td>
                    <td>신고작성자${i }</td>
                    <td>지금</td>
                    <td>1</td>
                    <td style="padding:0px;" align="center" class="btnn"><button>완료</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
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
    <script>
        $("tbody td").not($(".btnn")).click(function(){
            $("#openmd").click();
        })
    </script>
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
                <th>제목</th>
                <td>제목입니다</td>
            </tr>
            <tr>
                <td>신고자</td>
                <td>누구를</td>
            </tr>
            <tr>
                <td>대상</td>
                <td>누가</td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="" id="" cols="30" rows="10" style="resize: none;" readonly>신고</textarea></td>
            </tr>
          </table>
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer" align="center" style="height: 100px;">
            <button>신고 접수</button>
            <button data-dismiss="modal">닫기</button>
        </div>
  
      </div>
    </div>
  </div>
  <br>
</body>
</html>