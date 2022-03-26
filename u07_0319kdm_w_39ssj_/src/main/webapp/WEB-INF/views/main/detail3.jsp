<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>공부어때 동영상 강의 쇼핑몰</title>   
</head>
<style>

    #sidebar{
        border: 1px solid black;
        width: 33.3333%;
        position: fixed;
        text-align: center;
        float : left;
        max-height : 100vh;
        top : 10px;
        left : 66%;
    };

</style>
<body>
	<div class="container">
        <div class="wrap">
            <div class="video">
                <video autoplay controls style="width:66.6667%"/>
	         		<source src="<c:url value="${prod.video_name}"/>" type="video/mp4" >
		    	</video>
            </div>    
            <br>
            <div class="detail" style="width:66.6667%; text-align: center;">
                <p style="color:gray">상세정보 / 후기게시판 / 문의게시판<p>
                <hr>
            </div>    
            <br>
            <div class="info">
                <img src="/resources/assets/img/빙고.png" style="width:66.6667%">
            </div>
            <div class="info">
                <img src="/resources/assets/img/빙고.png" style="width:66.6667%">
            </div>
            <div class="info">
                <img src="/resources/assets/img/빙고.png" style="width:66.6667%">
            </div>
            <div id="sidebar">
        		<h1><p style="margin-top:30px">${prod.product_name}</p></h1>
                <p>${prod.product_description}</p> 				
				<h1><p><fmt:formatNumber type="currency" value="${prod.product_price}" /></p></h1>				
               	<br><br>
               	<p><button type="button" class="btn btn-primary" style="width:70%">장바구니 담기</button></p>
                <br>
                <p><button type="button" class="btn btn-primary" style="width:70%">장바구니 담기</button></p>
                <br>                
                <p><button type="button" class="btn btn-primary" style="width:70%">구매하기</button></p>
                <br><br><br><br><br>                 
       		</div> 
            
            
        </div>
        
        

        
    </div>  
    
    <%-- <table width="800" cellpadding="0" cellspacing="0" border="1">
      <tr>
         <td>번호</td>
         <td>제목</td>
         <td>작성자</td>
         <td>작성일자</td>
         <td>별점</td>
         <td>조회수</td>
      </tr>
      <c:forEach items="${rlist}" var="board">
       <input type="hidden" name="rating_check" value="${board.rating_check}">
       <input type="hidden" name="review_id" value="${board.review_id}">
      <tr>
         <td>${board.board_id}</td>       
         <td>
            <a href="rcontent_view?board_id=${board.board_id}&review_id=${board.review_id}">${board.board_title}</a></td>
         <td>${board.boardtype_id}</td>  
         <td>${board.member_id}</td>
         <td>${board.board_date}</td>
         <td>
		 	<img src="<c:url value="/resources/img/${board.rating_check}.png"/>" style="width:100px;"/>
		 </td>
         <td>${board.board_hit}</td>
      </tr>
      </c:forEach>
      <tr>
      <c:if test="${principal.user.member_id != null && board.order_detail_id != null}" > 
      	<c:if test="${principal.user.member_id != null}" >
			         <td colspan="10"><a href="rwrite_view">글작성</a> </td>
	    </c:if>	        
      </tr>                
   </table>
   
   <c:if test="${pageMaker.pre}">
         <a href="rlist${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
   </c:if>

	<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
	<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
		<a href="rlist${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>
	      
	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<a href="rlist${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
	</c:if> <br>--%>
     
</body>
</html>
