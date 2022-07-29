<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #topaa{
      margin-top: 50px;
      border: none;
      }

      #list-tb{
          text-align: center;
          width: 70%;
          height: 100px;
          color: lightgray       
      }
      #list-tb>thead{
          height: 50px;
      }
      #list-tb>tbody>tr{
      font-size: 15px;
      font-weight: 400;
      height: 30px;
      
      }
      #list-tb>tbody>tr>td{
      border-bottom: 1.5px solid black;
      }

      #ltb{ 
          background-color: white;
          color: black;
         

      }
      /* #ltb>tr{
          height: 80px;
      } */

      #list-tit{
      margin-bottom: 20px;
      font-size: 35px;
      font-weight: 1000;
      color: #A8B0FF;
      text-shadow:2px 2px lightgray;
      float: center;
  }
  .btns{
font-size: 16px;
border-radius: 10px;
width: 100px;
height: 40px;
text-decoration: none;
}

#writerBtn{
    height: 50px;
}

#list-tb:hover{
  cursor: pointer;
}

#list-tb>thead>tr>th{
color: lightgray;
background-color: #A8B0FF;
padding: 5px;
padding-bottom: 5px;
font-size: 20px;

}


</style>
</head>
<body>
    < class="outer" id="topaa" align="center" style="font-size:20px" border="none;">
        <div id="list-tit" align="center">결제 내역</div>
        <table align="center" id="list-tb" >
            <thead id="lth">
                <tr>
                    <th width="10%">번호</th>
                    <th width="30%">결제날짜</th>
                    <th width="25%">결제회원</th>
                    <th width="35%">결제승인번호</th>
                </tr>
            </thead>
            <tbody id="ltb">
            <!-- 리스트가 비어있는 경우 -->
            <!-- <%if(list.isEmpty()) {%> -->
                    <tr>
                        <td colspan="4" style="pointer-events: none;">추천 한 글이 없습니다.</td>
                    </tr>
            <!-- <%}else{ %> -->
            <!-- 비어있지 않을경우 -->
            
            <!-- <%for(Notice n : list) {%> -->
                <tr>
                    <td>1</td>
                    <td>추천합니다.</td>
                    <td>2022-07-01</td>
                    <td>추천</td>
                </tr>
                <!-- <%} %>
             <%} %> -->
             
            
                
            </tbody>
            

        </table>

        <br><br>

            <br>

            <div id="pagingArea">
                <ul class="pagination">
            <c:choose>
                <c:when test="${pi.currentPage eq 1">
                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="list.bo?cpage={pi.currentPage-1}">이전</a></li>
                </c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                <li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
            </c:forEach>
                
            <c:choose>
                <c:when test="${pi.currentPage eq pi.maxPage}">
                    <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage+1}">다음</a></li>
                </c:otherwise>
            </c:choose>
            </ul>
            </div>

            
        
    
        
        
        </div>
        
    </div>
</body>
</html>