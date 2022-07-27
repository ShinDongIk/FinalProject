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
	<c:choose>
		<c:when test="${loginUser.userId=='admin' }">
			<jsp:include page="../common/adminMypage.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="../common/menubar.jsp"/>
		</c:otherwise>
	</c:choose>
    <div id="content" align="center">
    	<form action="updateFaq.ad" id="form">
			<input type="hidden" name="boardNo" value="${b.boardNo }">
	        <table class="table table-bordered" style="width: 60%;">
	            <tr>
	                <th width="10%">제목</th>
	                <td width="45%"><input type="text" name="boardTitle" id="" value="${b.boardTitle }" required readonly></td>
	                <th width="10%">작성자</th>
	                <td width="10%">${b.boardWriter }</td>
	                <th width="10%">작성일</th>
	                <td width="15%">${b.createDate }</td>
	            </tr>
	            <tr>
	                <th>내용</th>
	                <td colspan="5"><textarea name="boardContent" id="" cols="30" rows="10" style="height: 600px; resize: none;" required readonly>${b.boardContent }</textarea></td>
	            </tr>
	            <tr>
	                <th>상단 고정</th>
	                <td colspan="5">
						<c:choose>
							<c:when test="${b.boardImp eq 'Y'}">
								<label for="imp" style="display: inline;">
		                            <input type="radio" name="boardImp" id="imp" value="Y" checked="checked" disabled>상단 고정
		                        </label>
		                        <label for="notImp" style="display: inline;">
		                            <input type="radio" name="boardImp" id="notImp" value="N" disabled>일반
		                        </label>
							</c:when>
							<c:otherwise>
								<label for="imp" style="display: inline;">
		                            <input type="radio" name="boardImp" id="imp" value="Y" disabled>상단 고정
		                        </label>
		                        <label for="notImp" style="display: inline;">
		                            <input type="radio" name="boardImp" id="notImp" value="N" checked="checked" disabled>일반
		                        </label>
							</c:otherwise>
						</c:choose>
	                </td>
	            </tr>
	                <td colspan="6" align="right">
	                	<c:if test="${loginUser.userId=='admin' }">
		                    <button type="button" id="update">수정</button>
		                    <button type="button" id="complete">완료</button>
		                    <button type="button" id="cancel" onclick="can();">취소</button>
	                	</c:if>
	                    <button type="button" onclick="history.back();" id="goBack">뒤로 가기</button>
	                </td>
	            </tr>
	        </table>
    	</form>
    </div>
    <c:if test="${not empty loginUser}">
		<jsp:include page="../chat/chat.jsp"/>
	</c:if>

    <script>
    	//수정 버튼 클릭 시 변화
        $(function(){
            $("#complete").hide();
            $("#cancel").hide();
            
            $("#update").click(function(){
                $("table input,textarea").removeAttr("readonly");
                $("table input:radio").removeAttr("disabled");
                $(this).hide();
                $("#goBack").hide();
                $("#complete").show();
                $("#cancel").show();
            })
        })

    	//취소 버튼 클릭 시 새로고침
        function can(){
            window.location.reload(true);
        }
    	
    	$("#complete").click(function(){
    		$("#form").submit();
    	})
        
    </script>


</body>
</html>