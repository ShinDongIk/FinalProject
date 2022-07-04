$(".ratePlan-delBtn").on("click",function(){
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