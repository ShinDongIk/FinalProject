  var INDEX = 0; 
  var nowChatNo = 0; //현재 채팅방
  var msgLenght = 0;
  var scroll = 'false';
  var interval = setInterval(function() {
   chatContentLoad();
}, 1000);
var intervalChatRoom = setInterval(function() {
   chatRoomLoad();
}, 1000);
clearInterval(interval);
//clearInterval(intervalChatRoom);
var chatscreen = 'false';
var tab2On = 'false';
var readSum = 0;
var toUser ="";

 
  function generate_message(msg,time,type) {
    INDEX++;
    var str="";
    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
    str += "       <div class=\"cm-msg-text\">";
    str += msg+"<br>";
     str += "<sub class='time-area "+type+"'>";
    str += time;
    str += "</sub>";
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
  
 function chatCircleClick(userNickname){
 	$("#chat-circle").toggle('scale');
    $(".chat-box").toggle('scale');
    chatscreen = 'true';
    loginUser = userNickname;
 }
  
  $(".chat-box-toggle").click(function() {
  	clearInterval(intervalChatRoom);
    $("#chat-circle").toggle('scale');
    $(".chat-box").toggle('scale');
    $('#tab1').trigger("click");
    clearInterval(interval);
    chatscreen = 'false';
  })

function contentSubClick(userNickname){
	loginUser = userNickname;
	chatContentEnter(userNickname);
}

function chatClick(userNickname){
	loginUser = userNickname;
	if($("#modal-nickName").val() != userNickname){
		if(chatscreen == 'false' && tab2On == 'false'){
			$("#chat-circle").trigger("click");
			chatscreen = 'true';
			
			$.ajax({
				url : "mkChat.ch",
				type : "post",
				data : {
					firstUserId : userNickname, //로그인 유저 닉네임 넣기
					secondUserId : $("#modal-nickName").val() //모달창의 회원 닉네임 넣기
				},
				success : function(result){
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
					firstUserId : userNickname, //로그인 유저 닉네임 넣기
					secondUserId : $("#modal-nickName").val() //모달창의 회원 닉네임 넣기
				},
				success : function(result){
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
	}else{
		alert("자기 자신에게 채팅을 걸 순 없습니다!");
	}
	

}

function chatContentLoad(){
	var msgType = "";
	$.ajax({
		url : "loadChatCont.ch",
		type : "post",
		data : {
			chatNo : nowChatNo,
			loginUser : loginUser
		},
		success : function(result){
			if(result == "NNNNN"){
				$("#tab1").trigger("click");
			}else if(result.length != 0){
				var str= "";
				for(var i=msgLenght; i<result.length;i++){
					if(loginUser == result[i].nickName){
						msgType="self";
					}
					else{
						msgType="user";
					}
			 		generate_message(result[i].chatContent,result[i].chatEnter, msgType);
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


function chatContentEnter(userNickname){
	loginUser = userNickname;
	if($("#chat-input").val().replace(/\n$/g,"").trim()!="" && $("#chat-input").val().trim()!=""){
		$.ajax({
			url : "chatContEnt.ch",
			type : "post",
			data : {
				chatNo : nowChatNo,
				chatContent : $("#chat-input").val().replace(/\n$/g,"").trim(),
				nickName : loginUser, //현재 로그인한 유저
				toUser : toUser //메세지 받을 유저
			},
			success : function(result){
			   var msg = loginUser+" : "+$("#chat-input").val().replace(/\n$/g,"").trim()+","+result+","+loginUserId;
			   $("#chat-input").val('');   
			   socket.send(msg);
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
		url : "chatRoomLoad.ch",
		type : "post",
		type : "post",
		data : {
			firstUserId : loginUser, //로그인 유저 닉네임 넣기
		},
		success : function(result){
			var readSumIn=0;
			var type = "";
			var userNick="";
			if(result.length == 0){
				str += "<div id='chat-room'>"
					+ "<span align='center'>채팅중인 채팅방이 존재하지 않습니다!</span><br>"
					+ "</div>";
			}else{
			for(var i in result){
				if(loginUser==result[i].firstUserId){
					userNick=result[i].secondUserId;
				}else{
					userNick=result[i].firstUserId;
				}
				if(result[i].notRead>0){
					type = "area-out"
				}else{
					type = "area-in"
				}
				readSumIn += result[i].notRead;
				str += "<div class='chat-list' >"
						+"<input id='chatRoomNum' type='hidden' value='"+result[i].chatNo+"'>"
						+"<input id='chat-nick' type='hidden' value='"+userNick+"'>"
						+"<span>채팅상대 : "+userNick+"</span><br>"
						+"<div class='read-num "+type+"'>"+result[i].notRead+"</div>"
						+"<button id='exit-chat'><i class='material-icons'>exit_to_app</i></button>"
	       				+"</div><br>";
	       		//$("#chat-room").html(str);
	       		if(readSum>0){
	       			$(".main-read-num").css('display','inline-block');
					$(".main-read-num").html(readSum);
				}else{
					$(".main-read-num").css('display','none');
				}
			}
			}
			$("#chat-room").html(str);
			readSum = readSumIn;
		},
		error : function(){
			console.log("통신 오류");
		}
	});
}


$(document).on("click","#exit-chat",function(e){
	e.stopPropagation();
	$.ajax({
			url : "chatRoomDelete.ch",
			type : "post",
			data : {
				chatNo : $(this).prevAll("#chatRoomNum").val(),
				userNick : $(this).prevAll("#chat-nick").val()
			},
			success : function(result){
			   if(result[0]=="NNNNY"){
			   	alert("채팅방을 정상적으로 나갔습니다!");
			   	var msg = loginUser+"님께서 채팅방을 나가셨습니다! "+loginUser+"님과의 채팅방은 삭제 됩니다!"+","+result[1]+","+loginUserId;
			   	socket.send(msg);
			   }else{
			   	alert("채팅방을 나가는 도중 오류가 발생하여 나가기에 실패하였습니다!");
			   }  
			},
			error : function(){
				console.log("통신 오류");
			}
		});
});

$("#chat-input").on("keyup",function(key){         
	if(key.keyCode==13) {            
	   chatContentEnter(loginUser);
	}     
});

$(document).on("click",".chat-list",function(){
	nowChatNo=$(this).find("#chatRoomNum").val();
	$("#tab2").trigger("click");
	$("#chat-title").html($(this).find("#chat-nick").val()+"님과의 채팅방");
	toUser = $(this).find("#chat-nick").val();
	chatContentLoad();
	interval = setInterval(function(){chatContentLoad();}, 1000);
});

//chatTab
$(function(){
  $('#chatContent').hide();
  $("#tab1").addClass('active');
  
  $('#tab2').click(function () {
  	if(nowChatNo==0){
		alert("들어가실 채팅방을 선택해 주세요!");
	}else{
		$('#chatRoom').hide().filter(this.hash).fadeIn();
    	$('#chatContent').show().filter(this.hash).fadeOut();
    	$('#tab1').removeClass('active');
    	$("#tab2").addClass('active');
    	$("#chat-room").html('');
    	tab2On = 'true';
    	clearInterval(intervalChatRoom);
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
    $("#chat-title").html("채팅");
    chatRoomLoad();
    intervalChatRoom = setInterval(function(){chatRoomLoad();},1000);
	clearInterval(interval);
  })
});

