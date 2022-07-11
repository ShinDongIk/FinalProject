  var INDEX = 0; 
  var nowChatNo = 0; //현재 채팅방
  var msgLenght = 0;
  var scroll = 'false';
  var interval = setInterval(function() {
   chatContentLoad();
}, 1000);
clearInterval(interval);
var chatscreen = 'false';
var tab2On = 'false';

 
  function generate_message(msg, type) {
    INDEX++;
    var str="";
    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
    str += "          <div class=\"cm-msg-text\">";
    str += msg;
    str += "          <\/div>";
    str += "        <\/div>";
    $("#chat-content-area").append(str);
    $("#cm-msg-"+INDEX).hide().fadeIn(300); 
    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);    
  }  

  $(document).delegate(".chat-btn", "click", function() {
    var value = $(this).attr("chat-value");
    var name = $(this).html();
    $("#chat-input").attr("disabled", false);
    generate_message(name, 'self');
  })
  
  $("#chat-circle").click(function() {    
    $("#chat-circle").toggle('scale');
    $(".chat-box").toggle('scale');
    chatscreen = 'true';
    chatRoomLoad();
  })
  
  $(".chat-box-toggle").click(function() {
    $("#chat-circle").toggle('scale');
    $(".chat-box").toggle('scale');
    $('#tab1').trigger("click");
    chatscreen = 'false';
  })


 $("#chat-content-submit").click(function() {
     chatContentEnter();
 });


function chatClick(){
	if(chatscreen == 'false' && tab2On == 'false'){
		$("#chat-circle").trigger("click");
		chatscreen = 'true';
		
		$.ajax({
			url : "mkChat.ch",
			type : "post",
			data : {
				firstUserId : "admin", //로그인 유저 닉네임 넣기
				secondUserId : "유저원" //모달창의 회원 닉네임 넣기
			},
			success : function(result){
				console.log(result);
				console.log("챗클릭 : "+result[0].chatNo);
				nowChatNo = result[0].chatNo;
				$("#tab2").trigger("click");
				chatContentLoad();
			},
			error : function(){
				console.log("통신 오류");
			}
		});
	}else if(chatscreen == 'true' && tab2On == 'false'){
		$.ajax({
			url : "mkChat.ch",
			type : "post",
			data : {
				firstUserId : "admin", //로그인 유저 닉네임 넣기
				secondUserId : "유저원" //모달창의 회원 닉네임 넣기
			},
			success : function(result){
				console.log(result);
				console.log("챗클릭 : "+result[0].chatNo);
				nowChatNo = result[0].chatNo;
				$("#tab2").trigger("click");
				chatContentLoad();
			},
			error : function(){
				console.log("통신 오류");
			}
		});
	}else if(chatscreen == 'true' && tab2On == 'true'){
		alert("이미 채팅중 입니다!");
	}
	
	$(".close-area").trigger("click");
}

function chatContentLoad(){
	var msgType = "";
	console.log(nowChatNo);
	$.ajax({
		url : "loadChatCont.ch",
		type : "post",
		data : {
			chatNo : nowChatNo
		},
		success : function(result){
			if(result.length != 0){
				var str= "";
				for(var i=msgLenght; i<result.length;i++){
					if("admin" == result[i].nickName){
						msgType="self";
					}
					else{
						msgType="user";
					}
					//str += "<span>"+result[i].chatContent+"</span><br>";
					//$("#chat-content-area").html(str);
			 		generate_message(result[i].chatContent, msgType);
			 	}
			 	msgLenght = result.length;
			 	if(scroll == 'false'){
			 		$(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000); 
			 		scroll = 'true';
			 	}   
			}
		},
		error : function(){
			console.log("통신 오류");
		}
	});
}


function chatContentEnter(){
	if($("#chat-input").val().replace(/\n$/g,"").trim()!="" && $("#chat-input").val().trim()!=""){
		$.ajax({
			url : "chatContEnt.ch",
			type : "post",
			data : {
				chatNo : nowChatNo,
				chatContent : $("#chat-input").val().replace(/\n$/g,"").trim(),
				nickName : "admin" //현재 로그인한 유저
			},
			success : function(result){
			   $("#chat-input").val('');   
			},
			error : function(){
				console.log("통신 오류");
			}
		});
	}else{
		$("#chat-input").val("");
		alert("채팅 내용을 입력하세요!");
	}
}

function chatRoomLoad(){
	var str = "";
	$.ajax({
		url : "mkChat.ch",
		type : "post",
		type : "post",
		data : {
			firstUserId : "admin", //로그인 유저 닉네임 넣기
			secondUserId : "유저원" //모달창의 회원 닉네임 넣기
		},
		success : function(result){
			var userNick="";
			for(var i in result){
				if("admin"==result[i].firstUserId){
					userNick=result[i].secondUserId;
				}else{
					userNick=result[i].firstUserId;
				}
				str += "<div class='chat-list' >"
						+"<input id='chatRoomNum' type='hidden' value='"+result[i].chatNo+"'>"
						+"<span>채팅상대 : "+userNick+"</span><br>"
						+"<button id='exit-chat'><i class='material-icons'>exit_to_app</i></button>"
	       				+"</div><br>";
	       		$("#chat-room").html(str);
			}
			
		},
		error : function(){
			console.log("통신 오류");
		}
	});
}


$(document).on("click",".chat-list",function(){
	nowChatNo=$(this).find("#chatRoomNum").val();
	$("#tab2").trigger("click");
	chatContentLoad();
	interval = setInterval(function(){chatContentLoad();}, 1000);
});

$("#chat-input").on("keyup",function(key){         
	if(key.keyCode==13) {            
	   chatContentEnter();
	}     
});



