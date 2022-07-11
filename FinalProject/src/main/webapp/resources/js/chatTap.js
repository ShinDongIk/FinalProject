$(function(){
  $('#chatContent').hide();
  $("#tab1").addClass('active');
  
  $('#tab2').click(function () {
  	console.log("tab2 : "+nowChatNo);
  	if(nowChatNo==0){
		alert("들어가실 채팅방을 선택해 주세요!");
	}else{
		$('#chatRoom').hide().filter(this.hash).fadeIn();
    	$('#chatContent').show().filter(this.hash).fadeOut();
    	$('#tab1').removeClass('active');
    	$("#tab2").addClass('active');
    	$("#chat-room").html('');
    	tab2On = 'true';
	}
  });
  $('#tab1').click(function () {
    $('#chatContent').hide().filter(this.hash).fadeIn();
    $('#chatRoom').show().filter(this.hash).fadeOut();
    $('#tab2').removeClass('active');
    $("#tab1").addClass('active');
    nowChatNo=0;
    msgLenght=0;
    tab2On = 'false';
    $("#chat-content-area").html("");
    chatRoomLoad();
	clearInterval(interval);
  })
});