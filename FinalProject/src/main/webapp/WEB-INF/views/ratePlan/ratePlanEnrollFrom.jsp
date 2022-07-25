<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ratePlanEnrollForm.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="${pageContext.request.contextPath}/js/ratePlanEnUpForm.js"></script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		var loginUserId = "${loginUser.userId}"; 
	</script>
	<div id="rp-enroll-area">
		<h1>요금제 정보 입력</h1>
		<form action="insert.ra" onsubmit="return checkInfo(event);" method="post" >
			<table id="rp-enroll-table">
					<tr>
						<th>OTT 선택</th>
						<td style="padding:0px">
							<select name="ottName">
								<option value="넷플릭스">넷플릭스</option>
								<option value="디즈니+">디즈니+</option>
								<option value="왓챠">왓챠</option>
								<option value="티빙">티빙</option>
								<option value="웨이브">웨이브</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>월 요금</th>
						<td style="padding:0px">
							<input type="text" name="monthPrice" value="" placeholder="숫자만 입력해주세요!">
						</td>
					</tr>
					<tr>
						<th>연 요금</th>
						<td style="padding:0px">
							<input type="text" name="yearPrice" value="" placeholder="숫자만 입력해주세요!">
						</td>
					</tr>
					<tr>
						<th>동시 접속자</th>
						<td style="padding:0px">
							<input type="text" name="concurrentUsers" value="" placeholder="숫자만 입력해주세요!">
						</td>
					</tr>
					<tr>
						<th>프로필수</th>
						<td style="padding:0px">
							<input type="text" name="profilesNum" value="" placeholder="숫자만 입력해주세요!">
						</td>
					</tr>
					<tr>
						<th rowspan="2" >최대 화질</th>
						<td style="padding:0px">
							<input id="quality-id" type="text" name="imageQuality" value="" placeholder="해상도를 입력해주세요!">
							<select id="quality-select" name="quality">
								<option value="K">K</option>
								<option value="P">P</option>
							</select>
						</td>
					</tr>
			</table>
			<div id="rp-enroll-submit">
				<button class="rt-en-button-color" type="submit">등록</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../chat/chat.jsp"/>
</body>
</html>