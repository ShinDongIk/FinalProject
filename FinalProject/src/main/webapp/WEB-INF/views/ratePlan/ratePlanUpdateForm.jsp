<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1>요금제 정보 수정</h1>
		<form action="update.ra" onsubmit="return checkInfo(event);" method="post">
			<input type="hidden" name="priceInfoNo" value="${rp.priceInfoNo}">
			<table id="rp-enroll-table">
					<tr>
						<th>OTT 선택</th>
						<td style="padding:0px">
							<select id="ottName-select" name="ottName">
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
							<input id="mp" type="text" name="monthPrice" value="${rp.monthPrice}" placeholder="숫자만 입력해주세요!">
						</td>
					</tr>
					<tr>
						<th>연 요금</th>
						<td style="padding:0px">
							<input id="yp" type="text" name="yearPrice" value="${rp.yearPrice}" placeholder="숫자만 입력해주세요!">
						</td>
					</tr>
					<tr>
						<th>동시 접속자</th>
						<td style="padding:0px">
							<input id="cu" type="text" name="concurrentUsers" value="${rp.concurrentUsers}" placeholder="숫자만 입력해주세요!">
						</td>
					</tr>
					<tr>
						<th>프로필수</th>
						<td style="padding:0px">
							<input id="pn" type="text" name="profilesNum" value="${rp.profilesNum}" placeholder="숫자만 입력해주세요!">
						</td>
					</tr>
					<tr>
						<th rowspan="2" >최대 화질</th>
						<td style="padding:0px">
							<input id="quality-id" type="text" name="imageQuality" value="" placeholder="해상도를 입력해주세요!">
							<select id="quality-select" name="qualityNum">
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
	<script>
		$(function(){
		   $("#ottName-select").val("${rp.ottName}").prop("selected",true);
		   $("#quality-select").val("${rp.imageQuality}".substr(-1,1)).prop("selected",true);
		   $("#mp").val("${rp.monthPrice}".substr(0,"${rp.monthPrice}".length-1));
		   $("#yp").val("${rp.yearPrice}".substr(0,"${rp.yearPrice}".length-1));
		   $("#cu").val("${rp.concurrentUsers}".substr(0,"${rp.concurrentUsers}".length-1));
		   $("#pn").val("${rp.profilesNum}".substr(0,"${rp.profilesNum}".length-1));
		   $("#quality-id").val("${rp.imageQuality}".substr(0,"${rp.imageQuality}".length-1));
		});
	</script>
</body>
</html>