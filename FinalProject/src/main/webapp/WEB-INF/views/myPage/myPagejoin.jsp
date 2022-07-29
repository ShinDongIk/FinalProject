<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="./resources/css/userEnrollFormStyle.css">
<style>
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	display: inline-block;
	background: #A8B0FF;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #e0e0e0;
	color: #222;
}

.tab-content {
	display: none;
	background: #e0e0e0;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}

.container {
	width: 80%;
}

.jparty {
	border: 1px solid #A8B0FF;
	width: 30%;
	height: 200px;
	text-align: center;
	display: inline-block;
}

.jouter {
	text-align: center;
}

.jbtn {
	border: 1px solid #A8B0FF;
	padding: 2px 5px;
	border-radius: 10px;
	background-color: #A8B0FF;
}
.mparty {
	border: 1px solid #A8B0FF;
	width: 30%;
	height: 200px;
	text-align: center;
	display: inline-block;
}

.mouter {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div>
		<h2>나의 파티</h2>
	</div>

	<br>

	<form action="partyMade.my" method="post" id="partyJoin">
		<div class="container">
			<!-- 탭 메뉴 상단 시작 -->
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">생성파티</li>
				<li class="tab-link" data-tab="tab-2">참여파티</li>

			</ul>
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div id="tab-1" class="tab-content current">

				<br>

				<div class="jouter">
					<c:choose>
						<c:when test="${empty list2}">
            	생성중인 파티가 없습니다.
            </c:when>

						<c:when test="${not empty list2}">
							<c:forEach var="mj" items="${list2}" varStatus="num">
								<div class="jparty"><br>
									<h2>${mj.partyOttEng }</h2>
									<br>
									<h3>${mj.partyEndDate }부터</h2>
									<br>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>
	</form>


	<form action="partyJoin.my" method="post" id="partyJoin">
		<div id="tab-2" class="tab-content">

			<br>

			<div class="mouter">
				<c:choose>
					<c:when test="${empty list}">
            	참여중인 파티가 없습니다.
            </c:when>

					<c:when test="${not empty list}">
						<c:forEach var="pj" items="${list}">
							<input type="hidden" class="joinNo" value="${pj.joinNo}">
							<div class="mparty">
								<h2>${pj.joinNo }</h2>
								<br>
								<h3>${pj.joinEnterDate }까지</h3>
								<div>
									<button type="button" class="jbtn" data-toggle="modal" data-target="#joinBtn">ID/PW보기</button>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>

		</div>
	</form>


	</div>
	<!-- 탭 메뉴 내용 끝 -->


	<div class="modal fade" id="joinBtn">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				​
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">ID-PW</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<input type="hidden" value="" id="pnum">
				<script>
					$(function() {

					})
				</script>
				​
				<form action="partyModal.me" method="post">
					<input type="hidden" name="userId" value="${loginUser.userId}">
					<!-- Modal body -->
					<div class="modal-body">
						<div class="table-responsive">
							<div class="container"></div>
							<table class="table table-hover">
								<thead class="text-center">
									<tr class="content">
										<th class="text-center">ID</th>
										<th class="text-center">PassWord</th>
									</tr>
								</thead>
								<tbody class="text-center">
									<tr class="content" style="font-size: 12px;">
										<td id="ottId" class="text-center"></td>
										<td id="ottPwd" class="text-center"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" id="mdSub" style="display: none;"></button>
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function() {

			$('ul.tabs li').click(function() { //선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current'); //선택 되있던 탭의 current css를 제거하고 
				$('.tab-content').removeClass('current');

				$(this).addClass('current'); ////선택된 탭에 current class를 삽입해줍니다.
				$("#" + tab_id).addClass('current');
			})

		});

		$(document).on("click", ".jbtn", function() {
			console.log("실행됨");
			//             	$("#mdSub").submit();
			var pPno = $(this).parent().siblings().eq(0).text();

			$.ajax({
				url : "joinparty",
				data : {
					joinNo : pPno
				},
				success : function(result) {

					$("#ottId").html(result.partyOttId);
					$("#ottPwd").html(result.partyOttPwd);
				},
				error : function() {
					console.log("통신 실패");
				}
			})
		});
	</script>
	${fn:length(partyLoginInfo)}
</body>
</html>