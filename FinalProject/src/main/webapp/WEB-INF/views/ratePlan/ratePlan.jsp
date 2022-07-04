<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTT별 요금제</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ratePlan.css"/>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div id="ratePlan-insertBtn-area">
		<button class="rt-button-color" onClick="location.href='insert.ra'">요금 등록</button>
	</div>
	<div class="tab-lists">
		<input id="ratePlan-tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
		<label class="ratePlan-tab-label" for="ratePlan-tab1">
			<img src="${pageContext.request.contextPath}/images/netflix.png">
			<br>
			<span>넷플릭스</span>
		</label>
		
		<input id="ratePlan-tab2" type="radio" name="tabs">
		<label class="ratePlan-tab-label" for="ratePlan-tab2">
			<img src="${pageContext.request.contextPath}/images/Disney.png">
			<br>
			<span>디즈니+</span>
		</label>
		
		<input id="ratePlan-tab3" type="radio" name="tabs">
		<label class="ratePlan-tab-label" for="ratePlan-tab3">
			<img src="${pageContext.request.contextPath}/images/watcha.png">
			<br>
			<span>왓챠</span>
		</label>
		
		<input id="ratePlan-tab4" type="radio" name="tabs">
		<label class="ratePlan-tab-label" for="ratePlan-tab4">
			<img src="${pageContext.request.contextPath}/images/tving.png">
			<br>
			<span>티빙</span>
		</label>
		
		<input id="ratePlan-tab5" style="display: none;"type="radio" name="tabs">
		<label class="ratePlan-tab-label" for="ratePlan-tab5">
			<img src="${pageContext.request.contextPath}/images/wave.png">
			<br>
			<span>웨이브</span>
		</label>
	   </div>
	<br>
	<div id="ratePlan-area">
		<table id="ratePlan-table" border=1 align="center">
			<thead>
				<tr>
					<th>월 요금</th>
					<th>연 요금</th>
					<th>동시 접속자</th>
					<th>프로필수 </th>
					<th>최대 화질</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>4,900</td>
					<td></td>
					<td>2명</td>
					<td>5개 </td>
					<td>1080P</td>
					<td><button class="rt-button-color">수정</button></td>
					<td><button class="ratePlan-delBtn rt-button-color">삭제</button></td>
				</tr>
				<tr>
					<td>222</td>
					<td>222</td>
					<td>2222명</td>
					<td>222개 </td>
					<td>222P</td>
					<td><button class="rt-button-color">수정</button></td>
					<td><button class="ratePlan-delBtn rt-button-color">삭제</button></td>
				</tr>
				<tr>
					<td>222</td>
					<td>222</td>
					<td>2222명</td>
					<td>222개 </td>
					<td>222P</td>
					<td><button class="rt-button-color">수정</button></td>
					<td><button class="ratePlan-delBtn rt-button-color">삭제</button></td>
				</tr>
			</tbody>
		</table>
		<script src="${pageContext.request.contextPath}/js/ratePlan.js"></script>
	</div>
	<jsp:include page="../chat/chat.jsp"/>
</body>
</html>