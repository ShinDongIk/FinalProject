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
								+"<input type='hidden' value='"+result[i].priceInfoNo+"'>"
								+"<td><button class='ratePlan-upBtn rt-button-color'>수정</button></td>"
								+"<td><button class='ratePlan-delBtn rt-button-color'>삭제</button></td>"
								+"</tr>"
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
		
