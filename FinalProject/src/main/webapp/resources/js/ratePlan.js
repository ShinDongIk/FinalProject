$(function(){
			$.ajax({
				url : "searchOtt.ra",
				type : "post",
				data : {ottName : $("#ratePlan-tab1").val()},
				success : function(result){
					var str = "";
					
					if(result.length > 0){
						for(var i in result){
							str += "<tr>"
								+"<td>"+result[i].monthPrice+"</td>"
								+"<td>"+result[i].yearPrice+"</td>"
								+"<td>"+result[i].concurrentUsers+"</td>"
								+"<td>"+result[i].profilesNum+"</td>"
								+"<td>"+result[i].imageQuality+"</td>"
								+"<td><button class='rt-button-color'>수정</button></td>"
								+"<td><button class='ratePlan-delBtn rt-button-color'>삭제</button></td>"
								+"</tr>"
						}
					}else{
						str = "<tr>"
								+"<td colspan='5'>"+"해당 OTT의 가격정보가 없습니다!"+"</td>"
								+"</tr>"
					}
					
					console.log(result);
					$("#ratePlan-table>tbody").html(str);
				},
				error : function(){
					console.log("통신 실패");
				}
				
			})
		});
		
	
		$(".tab-lists>input").on("click",function(){
			$.ajax({
				url : "searchOtt.ra",
				type : "post",
				data : {ottName : $(this).val()},
				success : function(result){
					var str = "";
					
					if(result.length > 0){
						for(var i in result){
							str += "<tr>"
								+"<td>"+result[i].monthPrice+"</td>"
								+"<td>"+result[i].yearPrice+"</td>"
								+"<td>"+result[i].concurrentUsers+"</td>"
								+"<td>"+result[i].profilesNum+"</td>"
								+"<td>"+result[i].imageQuality+"</td>"
								+"<td><button class='rt-button-color'>수정</button></td>"
								+"<td><button class='ratePlan-delBtn rt-button-color'>삭제</button></td>"
								+"</tr>"
						}
					}else{
						str = "<tr>"
								+"<td colspan='5'>"+"해당 OTT의 가격정보가 없습니다!"+"</td>"
								+"</tr>"
					}
					
					console.log(result);
					$("#ratePlan-table>tbody").html(str);
				},
				error : function(){
					console.log("통신 실패");
				}
				
			})
		});

	$(document).on("click",".ratePlan-delBtn",function(){
		var result = confirm("정말 삭제하시겠습니까?");

		if(result){
			//location.href="#";
			var quality = $(this).parent().prev().prev().html(); // 최대 화질
			var profilesNum = $(this).parent().prev().prev().prev().html(); //프로필 수
			var ConcurrentUsers = $(this).parent().prev().prev().prev().prev().html(); //동시 접속자 수
			var yearPrice = $(this).parent().prev().prev().prev().prev().prev().html(); //연 요금
			var mothPrice = $(this).parent().prev().prev().prev().prev().prev().prev().html(); //월 요금
			console.log(quality);
			console.log(profilesNum);
			console.log(ConcurrentUsers);
			console.log(yearPrice);
			console.log(mothPrice);
		}
	})
