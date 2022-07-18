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
    <jsp:include page="../common/adminMypage.jsp"/>
	
    <div id="content" align="center">
    	<form action="updateInquiry.in" method="post" enctype="multipart/form-data">
            <table class="table table-bordered" style="width: 60%;">
                <input type="hidden" name="oneNo">
            <thead>
                <tr>
                    <th width="10%">유형</th>
                    <td width="15%"><input type="text" name="inquiryType" value="${iq.inquiryType }"></td>
                    <th width="10%">작성자</th>
                    <td width="15%">${iq.inquiryWriter }</td>
                    <th width="10%">날짜</th>
                    <td width="15%">${iq.createDate }</td>
                    <th width="10%">처리 결과</th>
                    <td width="15%">${iq.status }</td>
                </tr>
            </thead>
                <tbody id="tbody">
                	<tr>
                		<th>문의 내용</th>
                		<td colspan="7"><textarea name="" id="" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;"readonly>${iq.inquiryContent } </textarea></td>
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
                    </tr>
                    <tr>
                        <th>답변 내용</th>
                        <td colspan="7"><textarea name="" id="" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;">답변입니다 </textarea></td>
                    </tr>
                </tbody>
                <tfoot>
                        <tr align="right">
                            <td colspan="8">
                            <c:if test="${loginUser.userId=='admin' }">
	                            <button id="add">등 록</button>
                            </c:if>
	                            <button type="button" id="update">수 정</button>
	                            <button type="button" id="complete">완 료</button>
	                            <button type="button" id="cancel" onclick="can();">취 소</button>
                            <button type="button" onclick="history.back();" id="goBack">뒤로가기</button>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
    
    <script>
    	$(function(){
        	$("#complete").hide();
            $("#cancel").hide();
            $("#update").click(function(){
                $(this).hide();
                $("#add").hide();
                $("#goBack").hide();
                $("#complete").show();
                $("#cancel").show();
            })
        })

        function can(){
            window.location.reload(true);
        }
    	
    	$("#complete").click(function(){
    		$("#form").submit();
    	})
    	
    </script>
</body>
</html>