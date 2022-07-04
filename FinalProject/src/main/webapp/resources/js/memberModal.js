$("#dec-btn").on("click",function(){
       $(".declaration").css("display","block");
       $("#modal .modal-window").css("height","530px");
});
        	
$("#dec-close").on("click",function(){
       $(".declaration").css("display","none");
       $("#modal .modal-window").css("height","220px");
});
        	
$(".close-area").on("click",function(){
       $("#modal").css("display","none");
       $(".declaration").css("display","none");
       $("#modal .modal-window").css("height","220px");
});

//모달창 외부 영역 클릭시 닫힘
$(document).mouseup(function (e){
	var container = $('#modal');
	if( container.has(e.target).length === 0){
		container.css('display','none');
		$(".declaration").css("display","none");
		$("#modal .modal-window").css("height","220px");
	}
});

function memModalOpen(){
	$(".modal-window").css("display","block");
	$("#modal.modal-overlay").css("display","flex");
}