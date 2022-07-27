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
<c:if test="${loginUser.userId == 'admin' }">
    <jsp:include page="../common/adminMypage.jsp"/>
	
    <div id="content" align="center">
    	<form action="updateInquiry.in" method="post" enctype="multipart/form-data">
            <table class="table table-bordered" style="width: 60%;">
            <thead>
                <tr>
                    <th width="10%">유형</th>
                    <td width="15%"><input type="text" name="inquiryType" value="${iq.inquiryType }" readonly></td>
                    <th width="10%">글 번호</th>
                	<td width="15%"><input type="text" name="inquiryNo" value="${iq.inquiryNo }"readonly></td>
                    <th width="10%">날짜</th>
                    <td width="15%">${iq.createDate }</td>
                    <th width="10%">처리 결과</th>
                    <td width="15%">${iq.status }</td>
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
                		<td colspan="7"><textarea name="" id="" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;"readonly>${iq.inquiryContent } </textarea></td>
                	</tr>
                    <tr>
                        <td></td>
	                   		<c:forEach var="i" items="${imgList }">
		                        <c:if test="${i.originName ne ''}">
				                    <td>
					                	<a href="${i.changeName }" download>${i.originName }</a>
				                    </td>
		                        </c:if>
		                	</c:forEach>
                    </tr>
                    <tr>
                    	<th>작성 일자</th>
                    	<td colspan="7" id="cdate"></td>
                    </tr>
                    <tr>
                        <th>답변 내용</th>
                        <td colspan="7"><textarea name="replyContent" id="rContent" cols="30" rows="10" style="resize: none; width: 100%; height: 100%;" readonly></textarea></td>
                    </tr>
                </tbody>
                <tfoot>
                        <tr align="right">
                            <td colspan="8">
	                            <button type="button" id="add">답글등록</button>
	                            <button type="button" id="addcom">답글등록</button>
	                            <button type="button" id="update">답글수정</button>
	                            <button type="button" id="delete" onclick="delete();">답글삭제</button>
	                            <button type="button" id="complete">수정완료</button>
	                            <button type="button" id="cancel" onclick="can();">취 소</button>
                            <button type="button" onclick="history.back();" id="goBack">뒤로가기</button>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
    </c:if>
    <script>
	  //수정 버튼 클릭 시 변화
        $(function(){
	            $("#complete").hide();
	            $("#cancel").hide();
	            $("#addcom").hide();
	            $("#update").click(function(){
	    			if($("#rContent").text()!=""){
		            	$("#add").hide();
		                $("#rContent").removeAttr("readonly");
		                $(this).hide();
		                $("#goBack").hide();
		                $("#delete").hide();
		                $("#complete").show();
		                $("#cancel").show();
	    			}else{
	    				alert("답글이 없습니다.");
	    			}
	            })
	            $("#add").click(function(){
	            	$("#rContent").removeAttr("readonly");
	            	$(this).hide();
	            	$("#update").hide();
	            	$("#goBack").hide();
	                $("#complete").hide();
	                $("#delete").hide();
	                $("#addcom").show();
	                $("#cancel").show();
	            })
	        	replyList();
        })
        function can(){
            window.location.reload(true);
        }
    	
    	$("#complete").click(function(){
    		$("#form").submit();
    	})
    	
    	$("#addcom").click(function(){
    		var vvv = $("#rContent").val().trim().length;
    		if(vvv != 0 ){
	    		$.ajax({
	    			url : "insertReply.in",
	    			data : {
	    				inquiryNo : ${iq.inquiryNo},
	    				replyContent : $("#rContent").val()
	    			},
	    			success : function(result){
	    				alert(result);
						replyList();
						window.location.reload(true);
	    			},
	    			error : function(){
	    				console.log("실패");
	    			}
	    		})
    		}else{
    			alert("댓글을 입력해주세요");
    		}
    	})
    		
		function replyList(){
	    	$.ajax({
	    		url : "replyList.in",
	    		data : {inquiryNo : ${iq.inquiryNo}},
	    		success : function(reply){
	    			$("#rContent").html(reply.replyContent);
	    			$("#cdate").append(reply.createDate);
	    		},error :{
	    		}
	   		})
    	}
    	
    	$("#complete").click(function(){
    		var vvv = $("#rContent").val().trim().length;
    		if(vvv != 0 ){
	    		$.ajax({
	    			url : "updateReply.in",
	    			data : {
	    				inquiryNo : ${iq.inquiryNo},
	    				replyContent : $("#rContent").val()
	    			},
	    			success : function(result){
	    				alert(result);
						replyList();
						window.location.reload(true);
	    			},
	    			error : function(){
	    				console.log("실패");
	    			}
	    		})
    		}else{
    			alert("댓글을 입력해주세요");
    		}
    	})
    	
	    $("#delete").click(function(){
			if($("#rContent").text()!=""){
		    		location.href="deleteReply.in?ino="+${iq.inquiryNo};
			}else{
				alert("답글이 없습니다.");
			}
	    })
    </script>
</body>
</html>