<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    #topaa{
      margin-top: 50px;
      border: none;
      }

      #list-tb{
          
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
      text-align: center;
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
	#pagingArea {
	width:fit-content; 
	margin:auto;
	
	}
	#pmouter{
	float: center;
	margin-left: 400px;
	}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>

	<form action="" method="post" id="pmouter">
    
        <div><h2>결제내역</h2></div>
        <br>
        <!-- 해당 아이디로 가져오기 -->
        
        

        <table align="center" id="list-tb">
            <thead id="lth">
                <tr>
                    <th width="35%">결제파티번호</th>
                    <th width="40%">결제날짜</th>
                    <th width="25%">결제승인번호</th>
                </tr>
            </thead>
            <tbody id="ltb">
            
                <!-- 리스트 비어있는경우 -->
                <c:choose>
                <c:when test="${empty list }">
                <tr>
                    <td colspan="4" style="pointer-events: none;">결제 내역이 없습니다.</td>
                </tr>
                </c:when>
                <c:otherwise>
                
                <!-- 비어있지 않을 경우 -->
                <c:forEach var="pm" items="${list }">
                
                <tr>
                    <td class="rno">NO.${pm.payPartyNo }</td>
                    <td>${pm.payDate }</td>
                    <td>${pm.payConfirmNo }</td>
                </tr>
                </c:forEach>
                </c:otherwise>
                </c:choose>
               
            </tbody>
        </table>
        
<!--         <script> --> 
<!-- // 	        $(function(){ -->
<!-- // 				$("#list-tb>tbody>tr").click(function(){ -->
<!-- // 					location.href = 'detail.re?rno=' + $(this).children(".rno").text(); -->
<!-- // 				});			 -->
<!-- // 			}); -->
<!--         </script> --> 
        
        
        
        </form>
    
        <br>
        
        <div id="pagingArea">
                <ul class="pagination">
            <c:choose>
                <c:when test="${pi.currentPage eq 1}">
                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="list.pm?cpage=${pi.currentPage-1}&userId=${loginUser.userId}">이전</a></li>
                </c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                <li class="page-item"><a class="page-link" href="list.pm?cpage=${p}&userId=${loginUser.userId}">${p}</a></li>
            </c:forEach>
                
            <c:choose>
                <c:when test="${pi.currentPage eq pi.maxPage}">
                    <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="list.pm?cpage=${pi.currentPage+1}&userId=${loginUser.userId}">다음</a></li>
                </c:otherwise>
            </c:choose>
            </ul>
            </div>

						

        
        
       
</body>
</html>