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
            <tr>
                <th width="10%">제목</th>
                <td width="45%"><input type="text" name="" id="" value="" required readonly></td>
                <th width="10%">작성자</th>
                <td width="10%">관리자</td>
                <th width="10%">작성일</th>
                <td width="15%">ㅇㅇㅇ</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="5"><textarea name="" id="" cols="30" rows="10" style="height: 600px;" required readonly></textarea></td>
            </tr>
            <tr>
                <th>상단 고정</th>
                <td colspan="5"><input type="checkbox" name="" id="" disabled></td>
            </tr>
            <th>
                <td colspan="4" align="right">
                    <button onclick="history.back();" id="goBack">뒤로 가기</button>
                </td>
            </th>
        </table>
    </div>

</body>
</html>