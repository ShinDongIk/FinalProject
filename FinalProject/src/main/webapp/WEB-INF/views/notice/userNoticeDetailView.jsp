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
	                <td colspan="5"><textarea name="boardContent" id="" cols="30" rows="10" style="height: 600px; resize:none;" required readonly>${b.boardContent }</textarea></td>
	            </tr>
	                <td colspan="6" align="right">
	                    <button type="button" onclick="history.back();" id="goBack">뒤로 가기</button>
	                </td>
	            </tr>
	        </table>
    </div>
</body>
</html>