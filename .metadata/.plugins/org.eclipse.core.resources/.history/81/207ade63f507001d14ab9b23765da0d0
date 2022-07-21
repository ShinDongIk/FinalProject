function submitChick(){
			$("#rp-enroll-table input[type=text]").each(function(index){
				var match="";
				if(index == '0'){
					if(!$("#rp-enroll-table input[type=text]").eq(index).val().match("원")){
						match = $("#rp-enroll-table input[type=text]").eq(index).val();
						match+="원";
						$("#rp-enroll-table input[type=text]").eq(index).val(match);
					}
				}else if(index == '1'){
					if($("#rp-enroll-table input[type=text]").eq(index).val().length>1 &&
						!$("#rp-enroll-table input[type=text]").eq(index).val().match("원")){
						match = $("#rp-enroll-table input[type=text]").eq(index).val();
						match+="원";
						$("#rp-enroll-table input[type=text]").eq(index).val(match);
					}
				}else if(index == '2'){
					if(!$("#rp-enroll-table input[type=text]").eq(index).val().match("명")){
						match = $("#rp-enroll-table input[type=text]").eq(index).val();
						match+="명";
						$("#rp-enroll-table input[type=text]").eq(index).val(match);
					}
				}
				else if(index == '3'){
					if(!$("#rp-enroll-table input[type=text]").eq(index).val().match("명")){
						match = $("#rp-enroll-table input[type=text]").eq(index).val();
						match+="개";
						$("#rp-enroll-table input[type=text]").eq(index).val(match);
					}
				}
				else if(index == '4'){
					if(!$("#rp-enroll-table input[type=text]").eq(index).val().match("K")&&
						!$("#rp-enroll-table input[type=text]").eq(index).val().match("P")){
						match = $("#rp-enroll-table input[type=text]").eq(index).val();
						match+=$("#quality-select").val();
						$("#rp-enroll-table input[type=text]").eq(index).val(match);
					}
				}
			});
		}
		
function checkInfo(event){
	$("#rp-enroll-table input[type=text]").each(function(index){
				const regex = /\d/;
				var str = $("#rp-enroll-table input[type=text]").eq(index).val();
				var info = "";
					
				switch(index){
					case 0:info="월 요금"; break;
					case 1:info="연 요금"; break;
					case 2:info="동시 접속자"; break;
					case 3:info="프로필 수"; break;
					case 4:info="최대 화질"; break;
				}
				if(index!=1 && str.length==0){
					alert(info+" 정보를 입력해주세요!");
					$("#rp-enroll-table input[type=text]").eq(index).focus()
					event.preventDefault();
					return false;
				}else if(str.length>0&&regex.test(str)==false){
					alert(info+"에 숫자만 입력해주세요!");
					$("#rp-enroll-table input[type=text]").eq(index).val("").focus();
					event.preventDefault();
					return false;
				}else if(index==4 && str.length!=0 && regex.test(str)!=false){
					console.log("실행됨");
					submitChick();
				}
				
	});
}