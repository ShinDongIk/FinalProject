<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<jsp:include page="../common/adminMypage.jsp"/>
    <div id="content" align="center">
        <form action="insertNotice.ad">
            <table class="table table-bordered" style="width: 60%;">
                <tr>
                    <th width="20%">제목</th>
                    <td width="50%"><input type="text" name="boardTitle" id="" required></td>
                    <th width="10%">작성자</th>
                    <td width="20%"><input type="text" name="boardWriter" id="" value="${loginUser.userId }" required readonly></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"><textarea name="boardContent" id="" cols="30" rows="10" style="height: 600px;" required></textarea></td>
                </tr>
                <tr>
                    <th>고정 여부</th>
                    <td colspan="3">
                        <label for="imp" style="display: inline;">
                            <input type="radio" name="boardImp" id="imp" value="Y">상단 고정
                        </label>
                        &nbsp
                        <label for="notImp" style="display: inline;">
                            <input type="radio" name="boardImp" id="notImp" value="N" checked="checked">일반
                        </label>
                    </td>
                </tr>
                <th>
                    <td colspan="4" align="right">
                        <button type="submit" id="bbb">작성</button>
                        <button onclick="history.back();">뒤로 가기</button>
                    </td>
                </th>
            </table>
        </form>
    </div>

</body>
</html>