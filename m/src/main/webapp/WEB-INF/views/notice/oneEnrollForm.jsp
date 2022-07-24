<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    input[type="file"]{
        /* display: none; */
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
    <div id="content" align="center">
        <p>1:1 문의</p>
        <table style="width: 60%;">
            <tr>
                <th>유형</th>
                <td colspan="4">
                    <select name="" id="">
                        <option value="">결제</option>
                        <option value="">계정</option>
                        <option value="">기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th>문의 내용</th>
                <td><textarea name="" id="" cols="30" rows="10" style="resize: none;"></textarea></td>
            </tr>
            <tr id="word">
                <th id="head">사진</th>
                <td><button type="button" onclick="addImg();">추가</button></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                <button>문의 접수</button>
                <button onclick="history.back();">뒤로 가기</button>
                </td>
                
            </tr>
        </table>
    </div>
    <script>
        //추가 버튼 클릭 시 이미지 개수 추가
        var count=0;
        function addImg(){
            if(count<5){
                var img="<tr>"
                    +"<td></td>"
                    +"<td><input type='file' name='upfile' id=''></td>" 
                    +"</tr>"
                    $("#word").after(img);
                    count++;
            }else{
                alert("이미지는 5개까지 첨부할 수 있습니다.")
            }

        }
    </script>


</body>
</html>