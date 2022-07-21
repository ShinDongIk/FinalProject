<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .likebtn{
        border: 1px solid lightgray;
        padding: 10px 20px;
        border-radius: 10px;
        background-color: #A8B0FF;
        display: inline-block;
    }
   
    .listimg{
        margin-top: 50px;
        border: 3px solid #A8B0FF;
        height: 220px;
        width: 150px;
        display: inline-block;
        box-sizing: border-box;
        margin-right: 20px;
        
        
    }
    .likebtn{
        float: left;
        display: inline-block;
    }
    .likelist2{
        text-align: center;

    }
    .title{
        text-align: center;
    }
    #delbtn{
        float: right;
        
    }
    #likelist{
        display: inline-block;
    }
    .like{
        text-align: center;
    }
    .liketitle{
        width: 80%;
        height: 90%;
        text-align: center;
    }
</style>
</head>
<body>
    <div class=liketitle>

    <div class="title"><h1>찜 내역</h1></div>

    <hr>

        <br><br>

        
        <div class="likelist">
            <div class="buttons">
                <div><button class="likebtn">전체</button></div>
                <div><button class="likebtn">장르</button></div>
                <div><button class="likebtn">OTT</button></div>
                <div><button class="likebtn" id="delbtn">선택삭제</button></div>
            </div>
            
            <br><br>

            <hr>

            <br>

            
            <div class="like">
                <div class="listimg li1">
                    <img src="" alt="">
                    <input type="checkbox" id="" name="lLi1" value="lLi1">
                    <label for="lLi1">킹스맨</label>
                </div>
            
                <div class="listimg li2"></div>
                <input type="checkbox" id="" name="lLi2" value="lLi2">
                <label for="lLi2">웨이브</label>
                <div class="listimg li3"></div>
                <input type="checkbox" id="" name="lLi3" value="lLi3">
                <label for="lLi3">라라랜드</label>
                <div class="listimg li4"></div>
                <!-- <input type="checkbox" id="" name="lLi4" value="lLi4">
                <label for="lLi4">넷플릭스</label> -->
            </div>
            
        </div>





    </div>

</body>
</html>