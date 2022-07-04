<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<div id="rp-enroll-area">
		<h1>요금제 정보 입력</h1>
		<form action="" onsubmit="return false;" method="post" >
			<table id="rp-enroll-table">
					<tr>
						<th>OTT 선택</th>
						<td style="padding:0px">
							<select name="OTT">
								<option value="1">넷플릭스</option>
								<option value="2">디즈니 플러스</option>
								<option value="3">왓챠</option>
								<option value="4">티빙</option>
								<option value="5">웨이브</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>월 요금</th>
						<td style="padding:0px">
							<input type="text" name="mothPrice" value="" placeholder="숫자만 입력해주세요!">
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
							<input type="text" name="ConcurrentUsers" value="" placeholder="숫자만 입력해주세요!">
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
							<input id="quality-id" type="text" name="quality" value="" placeholder="해상도를 입력해주세요!">
							<select id="quality-select" name="qualityNum">
								<option value="1">K</option>
								<option value="2">P</option>
							</select>
						</td>
					</tr>
			</table>
			<div id="rp-enroll-submit">
				<button class="rt-en-button-color" type="submit" onClick="submitChick();">등록</button>
			</div>
		</form>
	</div>
	<script>
		
	</script>
	
	<jsp:include page="../chat/chat.jsp"/>
</body>
</html>