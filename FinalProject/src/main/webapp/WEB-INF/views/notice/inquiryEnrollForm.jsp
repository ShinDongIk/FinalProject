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
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
    <div id="content" align="center">
        <form action="insertInquiry.in" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="inquiryWriter" value="${loginUser.userId }">
            <p>1:1 문의</p>
            <table style="width: 60%;">
                <tr>
                    <th width="7%">유형</th>
                    <td colspan="5">
                        <select name="inquiryType">
                            <option value="10">결제</option>
                            <option value="20">계정</option>
                            <option value="30">파티</option>
                            <option value="40">기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="6"><input type="text" name="inquiryTitle"></td>
                </tr>
                <tr>
                    <th>문의 내용</th>
                    <td colspan="5"><textarea name="inquiryContent" cols="30" rows="10" style="resize: none;"></textarea></td>
                </tr>
                <tr id="word">
                    <th id="head">사진</th>
                    <td id="imgtd" colspan="4"></td>
                    <td>
                    	<button type="button" onclick="addImg();">추가</button>
                    	<button type="button" onclick="deleteImg();">삭제</button>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="6">
                        <button type="submit">문의 접수</button>
                        <button type="button" onclick="history.back();">뒤로 가기</button>
                    </td>
                    
                </tr>
            </table>
        </form>
    </div>
    <c:if test="${not empty loginUser}">
		<jsp:include page="../chat/chat.jsp"/>
	</c:if>
    <script>
        //추가 버튼 클릭 시 이미지 개수 추가
        var count=0;
        
        function addImg(){
	    	if(count<5){
		        var img ="<input type='file' name='upfile' id='img"+count+"'accept='image/*'>";
			    $("#imgtd").append(img);
		        $("#img"+count).click();
				count++;
	        }else{
	        	alert("이미지는 5개까지 첨부할 수 있습니다.")
	        }
        }
        function deleteImg(){
        	if(count==0){
        		alert("이미지가 없습니다.")
        	}else{
        		count--;
        		$("#img"+count).remove();
        	}
        }
    </script>


</body>
</html>