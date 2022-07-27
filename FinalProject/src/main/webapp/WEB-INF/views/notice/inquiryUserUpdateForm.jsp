<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
	
    <div id="content" align="center">
    	<form action="updateUserInquiry.in" method="post" enctype="multipart/form-data">
    		<input type="hidden" name="inquiryNo" value="${iq.inquiryNo }">
            <table class="table table-bordered" style="width: 60%;">
            <thead id="thead">
                <tr>
                    <th width="10%">유형</th>
                    <td width="15%">
						<select name="inquiryType">
							<c:forEach var="t" items="${tList }">
	                            <option value="${t.boardType }">${t.typeName }</option>
							</c:forEach>
                        </select>
                    </td>
                    <script>
                    	$(function(){
                    		$("#thead option").each(function(){
                    			if($(this).val()==${iq.inquiryTypeNum}){
                    				$(this).attr("selected",true)
                    			}
                    		})
                    	})
                    </script>
                    <th width="10%">글 번호</th>
                	<td width="15%"><input type="text" name="inquiryNo" value="${iq.inquiryNo }"readonly></td>
                    <th width="10%">날짜</th>
                    <td width="15%"><input type="text" name="createDate" value="${iq.createDate }" readonly></td>
                    <th width="10%">처리 결과</th>
                    <td width="15%"><input type="text" name="status" value="${iq.status }" readonly></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input type="text" name="inquiryWriter" value="${iq.inquiryWriter }" readonly></td>
                	<th>제목</th>
                	<td colspan="5"><input type="text" name="inquiryTitle" value="${iq.inquiryTitle }"></td>
                </tr>
            </thead>
                <tbody id="tbody">
                	<tr>
                		<th>문의 내용</th>
                		<td colspan="7"><textarea name="inquiryContent" id="incon" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;">${iq.inquiryContent } </textarea></td>
                	</tr>
                    <tr>
                        <th>기존<br>사진</th>
		                   		<c:forEach var="i" items="${imgList }">
			                        <c:if test="${i.originName ne 'null'}">
					                    <td id="imageBody">
						                	<a href="${i.changeName }" download>${i.originName }</a>
					                    </td>
			                        </c:if>
			                	</c:forEach>
						                <input type="hidden" name="changeName" value="${iq.changeName }">
						                <input type="hidden" name="originName" value="${iq.originName }">
                    </tr>
                    <tr id="word">
	                    <th id="head">사진</th>
	                    <td id="imgtd" colspan="6"></td>
	                    <td>
	                    	<button type="button" onclick="addImg();">추가</button>
	                    	<button type="button" onclick="deleteImg();">삭제</button>
	                    </td>
                	</tr>
                </tbody>
                <tfoot>
                        <tr align="right">
                            <td colspan="8">
	                        <button type="submit">완 료</button>
                            <button type="button" onclick="history.back();" id="goBack">뒤로가기</button>
                        </td>
                    </tr>
                </tfoot>
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