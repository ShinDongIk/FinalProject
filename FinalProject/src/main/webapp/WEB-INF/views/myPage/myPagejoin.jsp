<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
    
}

ul.tabs li{
  display: inline-block;
	background: #A8B0FF;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
    
}

ul.tabs li.current{
	background: #e0e0e0;
	color: #222;
}

.tab-content{
  display: none;
	background: #e0e0e0;
	padding: 12px;
   
}

.tab-content.current{
	display: inherit;
}
.container{
    width: 80%;
}
.jparty{
    border: 1px solid #A8B0FF;
    width: 30%;
    height: 200px;
    text-align: center;
    display: inline-block;

}
.jouter{
    text-align: center;
}
.jbtn{
    border: 1px solid #A8B0FF;
    padding: 2px 5px;
    border-radius: 10px;
    background-color: #A8B0FF;

}


 
  </style>
</head>
<body>

    <div><h2>나의 파티</h2></div>

    <br>

    <div class="container">
        <!-- 탭 메뉴 상단 시작 -->
            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-1">참여파티</li>
                <li class="tab-link" data-tab="tab-2">생성파티</li>
                
            </ul>
        <!-- 탭 메뉴 상단 끝 -->
        <!-- 탭 메뉴 내용 시작 -->
            <div id="tab-1" class="tab-content current">
            
            <div class="empty">
                <p>참여중인 파티가 없습니다.</p>
            </div>
            
            <br>

            <div class="jouter">
                <div class="jparty">
                    <h3>넷플릭스 프리미엄</h3>
                    <h6>[1등판매자/한국재생가능/연장가능]</h6><br>
                    2022.07.08까지
                    <div><button class="jbtn">ID/PW보기</button></div>
                </div>
                <div class="jparty">
                    <h3>넷플릭스 프리미엄</h3>
                    <h6>[1등판매자/한국재생가능/연장가능]</h6><br>
                    2022.07.08까지
                    <div><button class="jbtn">ID/PW보기</button></div>
                </div>
                <div class="jparty">
                    <h3>넷플릭스 프리미엄</h3>
                    <h6>[1등판매자/한국재생가능/연장가능]</h6><br>
                    2022.07.08까지
                    <div><button class="jbtn">ID/PW보기</button></div>
                </div>
                

            </div>
        
        
            </div>
            <div id="tab-2" class="tab-content">
            <p>생성중인 파티가 없습니다.</p>
        
            

            </div>
        <!-- 탭 메뉴 내용 끝 -->
        </div>

        <script>
            $(document).ready(function(){
	
            $('ul.tabs li').click(function(){							//선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
                var tab_id = $(this).attr('data-tab');

                $('ul.tabs li').removeClass('current');			//선택 되있던 탭의 current css를 제거하고 
                $('.tab-content').removeClass('current');		

                $(this).addClass('current');								////선택된 탭에 current class를 삽입해줍니다.
                $("#" + tab_id).addClass('current');
            })

            });
        </script>
</body>
</html>
