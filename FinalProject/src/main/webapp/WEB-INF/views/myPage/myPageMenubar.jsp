<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #navi{
        list-style-type: none;
        padding: 0px;
        height: 100%;
        
        
    }
    #navi>li{
        display: inline-block;
        text-align: center;
        width: 21%;
        color: lightgray;
    }
    #navi a{
        font-size: 22px;
        text-decoration: none;
        color: #A8B0FF;
        font-weight: bold;
        width: 100%;
        height: 100%;
    }
    #navi a:hover{
            font-size: 25px;
            color: dimgray;
        }
    
</style>
</head>
<body>
    
        <div id="navigator" align="center">
            <ul id="navi">
                <li><a href="">찜 내역</a></li>
                <li><a href="">파티참여내역</a></li>
                <li><a href="">작성글 확인</a></li>
                <li><a href="">회원 정보 수정</a></li>
            </ul>
        </div>