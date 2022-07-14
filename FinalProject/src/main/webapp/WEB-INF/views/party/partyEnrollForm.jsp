<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="./resources/css/partyEnrollFormStyle.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />

</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    
    <div class="outer">
        <br>
        <span class="subTitle">
            <b class="font-purple">신규파티 </b><b>등록</b>
        </span>
        <hr>
        <div class="joimForm">
            <div class="notice" style="text-align: left;">
                🔔 <b> 파티 등록 전 꼭 확인해주세요!</b> <br><br>
                * 개인 연락처 또는 카카오톡, 개인간 거래 유도 행위는 불법으로 간주하며, 적발시 사전동의 없이 파티장 권한이 중지 됩니다. <br>
                * 작성된 정보는 당사에 수집되며 진행 중인 파티에 문제가 발생한 경우에 확인 및 해결을 위해 활용 될 수 있습니다. <br>
                * 파티 금액 정산가능 소요일은 <span>등급별</span>로 상이합니다.
            </div>
            <br><br>
            <form action="">
                <table class="joinTable table" align="center">
                    <tr>
                        <th>OTT 선택</th>
                        <td>
                            <div class="logoArea">
                                <img src="./resources/images/netflix.png" alt="" class="rounded-circle logoImg"><br>
                                <span>일/100원</span>
                            </div>
                            <div class="logoArea">
                                <img src="./resources/images/wave.png" alt="" class="rounded-circle logoImg"><br>
                                <span>일/100원</span>
                            </div>
                            <div class="logoArea">
                                <img src="./resources/images/tving.png" alt="" class="rounded-circle logoImg"><br>
                                <span>일/100원</span>
                            </div>
                            <div class="logoArea">
                                <img src="./resources/images/Disney.png" alt="" class="rounded-circle logoImg"><br>
                                <span>일/100원</span>
                            </div>
                            <div class="logoArea">
                                <img src="./resources/images/watcha.png" alt="" class="rounded-circle logoImg"><br>
                                <span>일/100원</span>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>모집인원</th>
                        <td>
                            <div class="partyMemberNum">
                                <span class="material-symbols-outlined" style="color: #a8b0ff;">person</span>
                                <span class="material-symbols-outlined" style="color: #a8b0ff;">person</span>
                                <span class="material-symbols-outlined" style="color: #a8b0ff;">person</span>
                                <span class="material-symbols-outlined" style="color: gray;">person</span>
                                <span class="material-symbols-outlined" style="color: gray;">person</span>
                                &ensp;
                                <span>
                                    <b style="font-size: medium;">3 명</b>
                                </span>
                            </div>
                            <!-- <input type="range" min="1" max="5" class="form-control fullInput" required placeholder="1 ~ 5"> -->
                        </td>

                    </tr>

                    <tr>
                        <th>진행기간</th> 
                        <td><input type="date" class="form-control harfInput" required><p class="etc">～</p><input type="date" class="form-control harfInput" id="endDate" required></td>
                    </tr>
                    <tr>
                        <th>예상수령금액</th> 
                        <td>
                            <p><span class="priceInfo">100</span> 원
                                <span class="operator">&ensp;*&ensp;</span>
                                <span class="priceInfo">3</span> 명
                                <span class="operator">&ensp;*&ensp;</span>
                                <span class="priceInfo">60</span> 일
                                <span class="operator">&ensp;=&ensp;</span>
                                <span class="priceInfo" style="color: #a8b0ff;"> 18,000</span>원
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th>수령계좌정보</th>
                        <td>
                            <select name="" id="" class="form-control quarterInput" >
                                <option value="">카카오</option>
                                <option value="">국민</option>
                                <option value="">우리</option>
                                <option value="">신한</option>
                                <option value="">하나</option>
                                <option value="">SC</option>
                            </select>
                            <p class="etc">　</p>
                            <input type="text" class="form-control harfInput" placeholder="계좌번호" required>
                            <p class="etc">　</p>
                            <input type="text"class=" form-control quarterInput" placeholder="예금주">
                        </td>
                    </tr>
                    <tr>
                        <th>공유계정정보</th>
                        <td>
                            <input type="text" class="form-control harfInput" placeholder="아이디" required>
                            <p class="etc">　</p>
                            <input type="text"class=" form-control harfInput" placeholder="비밀번호">
                        </td>
                    </tr>

                    <tr>
                        <!-- 하이픈형식 000-0000-0000 -->
                        <th>파티규칙</th>
                    <td>
                        <textarea name="" id="" cols="30" rows="10" class=" form-control" style="resize: none;"></textarea>
                    </td>
                </tr>
            </table>
            <br>
            <button type="button" class="btn button-gray">취소</button>
            <button type="submit" class="btn button-purple">등록</button>
         </form>
       </div>        
    </div>
</body>
</html>