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
            <table class="table table-bordered" style="width: 60%;">
            <thead>
                <tr>
                    <th width="10%">유형</th>
                    <td width="15%"><input type="text" name="inquiryType" value="${iq.inquiryType }" readonly></td>
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
                	<td colspan="5"><input type="text" name="inquiryTitle" value="${iq.inquiryTitle }" readonly></td>
                </tr>
            </thead>
                <tbody id="tbody">
                	<tr>
                		<th>문의 내용</th>
                		<td colspan="7"><textarea name="inquiryContent" id="incon" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;"readonly>${iq.inquiryContent } </textarea></td>
                	</tr>
                    <tr>
                        <td></td>
	                   		<c:forEach var="i" items="${imgList }">
		                        <c:if test="${i.originName ne 'null'}">
				                    <td>
					                	<a href="${i.changeName }" download>${i.originName }</a>
				                    </td>
		                        </c:if>
		                	</c:forEach>
			                <input type="hidden" name="changeName" value="${i.changeName }">
			                <input type="hidden" name="originName" value="${i.originName }">
                    </tr>
                    <tr>
                        <th>답변 내용</th>
                        <td colspan="7"><textarea name="" id="rContent" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;" readonly> </textarea></td>
                    </tr>
                </tbody>
                <tfoot>
                        <tr align="right">
                            <td colspan="8">
	                        <button type="button" onclick="location.href='inquiryUserUpdateForm.in?ino=${iq.inquiryNo }'">수 정</button>
                            <button type="button" onclick="history.back();" id="goBack">뒤로가기</button>
                        </td>
                    </tr>
                </tfoot>
            </table>
    </div>
    <c:if test="${not empty loginUser}">
		<jsp:include page="../chat/chat.jsp"/>
	</c:if>
    <script>
    $(function(){
    	replyList();
    })
    
	function replyList(){
    	$.ajax({
    		url : "replyList.in",
    		data : {inquiryNo : ${iq.inquiryNo}},
    		success : function(reply){
    			$("#rContent").html(reply.replyContent);
    		},error :{
    		}
   		})
	}
    </script>
</body>
</html>