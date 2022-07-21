//시작시 가격정보 불러오는 ajax
$(function(){
			$.ajax({
				url : "searchOtt.ra",
				type : "post",
				data : {ottName : $("#ratePlan-tab1").val()},
				success : function(result){
					var str = "";
					
					if(result.length > 0){
						for(var i in result){
							str += "<tr>"+"<td>"+result[i].monthPrice+"</td>";
								
								if(result[i].yearPrice == undefined){
									str += "<td></td>";
								}else{
									str += "<td>"+result[i].yearPrice+"</td>";
								}
							str +=	"<td>"+result[i].concurrentUsers+"</td>"
								+"<td>"+result[i].profilesNum+"</td>"
								+"<td>"+result[i].imageQuality+"</td>"
								+"<input type='hidden' value='"+result[i].priceInfoNo+"'>";
							if(loginUserId == "admin"){
								str +="<td><button class='ratePlan-upBtn rt-button-color'>수정</button></td>"
								str +="<td><button class='ratePlan-delBtn rt-button-color'>삭제</button></td>"
							}
							str +="</tr>";
						}
					}else{
						str = "<tr>"
								+"<td colspan='5'>"+"해당 OTT의 가격정보가 없습니다!"+"</td>"
								+"</tr>"
					}
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
			location.href="delete.ra?priceInfoNo="+$(this).parent().prev().prev().val();
		}
	});
	
	$(document).on("click",".ratePlan-upBtn",function(){
		console.log($(this).parent().prev().val());
		location.href="updateEnroll.ra?priceInfoNo="+$(this).parent().prev().val();
	});
