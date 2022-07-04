function submitChick(){
			$("#rp-enroll-table input[type=text]").each(function(index){
				var match="";
				if(index == '0' || index == '1'){
					if(!$("#rp-enroll-table input[type=text]").eq(index).val().match("원")){
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
				
			});
		}