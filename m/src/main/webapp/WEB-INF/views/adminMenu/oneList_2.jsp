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
    .inquiry{
        display: none;
    }
</style>
</head>

<body>
	<jsp:include page="../myPage/adminMypage.jsp"/>
    <div id="content" align="center">
        <p>신고 관리</p>
            <select name="" id="" style="display: inline; width: 150px;">
                <option value="">제목</option>
                <option value="">작성자</option>
            </select>
    	<input type="text" style="width: 30%; display: inline;">&nbsp<button>검색</button>
        <br>
        <table class="table table-bordered" style="width: 60%;">
            <thead>
                <tr>
                    <th width="10%">유형</th>
                    <th width="45%">내용</th>
                    <th width="15%">작성자</th>
                    <th width="10%">날짜</th>
                    <th width="20%">처리 결과</th>
                </tr>
            </thead>
            <tbody id="tbody">
            	<c:forEach var="i" begin="1" end="10">
                <tr class="title${i }">
                    <td>결제</td>
                    <td><li>dd</li></td>
                    <td>아이디</td>
                    <td>지금</td>
                    <td>안됨</td>
                </tr>
                <tr class="inquiry content${i }">
                    <td></td>
                    <td>내용${i}</td>
                    <td colspan="3"></td>
                </tr>
                <tr class="inquiry answer${i }">
                    <td>관리자</td>
                    <td colspan="2"><textarea name="" id="" cols="30" rows="10" style="resize: none;">답변${i}</textarea></td>
                    <td>지금</td>
                    <td>안됨</td>
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
    	var num="";
        $("tbody li").click(function(){
        	num=$(this).parent().parent().attr('class').substring(5);
        	
            if($(".content"+num).css("display")=="none"){
                $(".content"+num).show();
                $(".answer"+num).show();   
            }else{
                $(".content"+num).hide();
                $(".answer"+num).hide();
            }
        })
    </script>
  <br>
</body>
</html>