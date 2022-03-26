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
    img{
        width : 80%;
    }
    
    .paging{
		text-align : center;
	}
	
</style>
<body>
<div class="container">
    <section class="ftco-section">
    	<div class="container">
    		<div class="row" style="height:80%">
    			<div class="col-lg-6 ftco-animate">
    				<video autoplay controls style="width:100%; height: 80%;"/>
	         		    <source src="<c:url value="${prod.video_name}"/>" type="video/mp4" >
		    	    </video>
                </div>
    			<div class="col-lg-6 product-details ftco-animate" style="height:500px">
    				<br>
    				<h3>${prod.product_name}</h3>
    				<br>
    				<h1><p><fmt:formatNumber type="currency" value="${prod.product_price}" /></p></h1>				               
    				<br>
    				<p>${prod.product_description}${prod.product_description}${prod.product_description}${prod.product_description}${prod.product_description}${prod.product_description}</p>					
          	        ${prod.product_description}${prod.product_description}
          	        <br><br>
          	        <p>  
						<a href="/main/cartorder?product_id=${prod.product_id}" class="btn btn-primary my-2">장바구니 담기</a>
		              	<a href="/main/checkout?product_id=${prod.product_id}" class="btn btn-primary my-2">구매하기</a>
		              	<%-- <a href="/main/playVideo?product_id=${prod.product_id}" class="btn btn-primary my-2">Play</a> --%>		                     	        
          	        </p>
    			</div>
    		</div>
    	</div>
    </section>
    <br><br>
    <div class="detail" style="text-align: center;">
<!--         <p style="color:gray">상세정보 / 후기게시판 / 문의게시판<p>
        <hr> -->
    </div>    
    <br>
    <div class="info">
        <img src="/resources/assets/img/빙고.png" >
    </div>
    <div class="info">
        <img src="/resources/assets/img/빙고.png" >
    </div>
    <div class="info">
        <img src="/resources/assets/img/빙고.png" >
    </div>
</div> 		

<br>
	<div class="container">  
		<table class="table">  
			<h4>후기 게시판</h4>   
			<thead> 
				<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col" style="text-align:center">작성자</th>
				<th scope="col" style="text-align:center">작성일자</th>
				<th scope="col" style="text-align:center">별점</th>
				<th scope="col" style="text-align:center">조회수</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${rlist}" var="board">
					<input type="hidden" name="rating_check" value="${board.rating_check}">
	      			<input type="hidden" name="review_id" value="${board.review_id}">	      
					<tr>
						<td>${board.board_id}</td>
						<td>
						<a href="rcontent_view?board_id=${board.board_id}&review_id=${board.review_id}" style="text-decoration:none; color:black">${board.board_title}</a></td>
						<td style="text-align:center">${board.member_id}</td>
				        <td style="text-align:center">${board.board_date}</td>
				        <td style="text-align:center">
							<img src="<c:url value="/resources/img/${board.rating_check}.png"/>" style="width:100px; text-align:center;"/>
						</td>
				        <td style="text-align:center">${board.board_hit}</td>
      				</tr>
				</c:forEach>       
			</tbody>
		<br>
		</table>
		
		<div class="paging">		
			<c:if test="${pageMaker.pre}">
				<a href="rlist${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
			</c:if>		   
			<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<a href="rlist${pageMaker.makeQuery(idx)}" style="text-decoration:none; color:black">${idx}&nbsp;&nbsp;</a>
			</c:forEach>			      
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="rlist${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
			</c:if> 
		</div>		
	<div>

	
<br>
	<div class="container">  
		<table class="table">  
			<h4>문의 게시판</h4>   
			<thead> 
				<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col" style="text-align:center">작성자</th>
				<th scope="col" style="text-align:center">작성일자</th>			
				<th scope="col" style="text-align:center">조회수</th>
				</tr>
			</thead>
			<tbody>	
				<c:forEach items="${qlist}" var="qboard">
      	 		<tr>
			       	 <input type="hidden" name="reply_group" value="${qboard.reply_group}">
			       	 <input type="hidden" name="board_enable" value="${qboard.board_enable}">
			         <td>${qboard.board_id}</td>           
			         <td>                 	
	        			<c:if test="${qboard.board_enable=='N'}">
			            <img src="${pageContext.request.contextPath}/resources/img/lock1.png" style="width : 0.8em"/>
			            <c:choose>
			                <c:when test="${qboard.member_id eq principal.user.member_id || principal.user.member_id == 'kbatc5' || principal.user.member_id == 'admin'}">	
			                	<c:forEach begin="1" end="${qboard.reply_indent}">[답변]</c:forEach>
			        			<a href="qcontent_view?board_id=${qboard.board_id}&reply_group=${qboard.reply_group}" style="text-decoration:none; color:black"><c:out value="${qboard.board_title}" /></a>	          
			                </c:when>
			                <c:otherwise>비밀글은 작성자와 크리에이터만 볼 수 있습니다.</c:otherwise>
			            </c:choose>
			       	</c:if>
			        <c:if test="${qboard.board_enable == 'Y'}">
			        	<c:forEach begin="1" end="${qboard.reply_indent}">[답변]</c:forEach>
			        	<a href="qcontent_view?board_id=${qboard.board_id}&reply_group=${qboard.reply_group}" style="text-decoration:none; color:black">
			        	<c:out value="${qboard.board_title}"/></a>
			        </c:if>	
		         	</td>
		         <td style="text-align:center">${qboard.member_id} </td>      
		         <td style="text-align:center">${qboard.board_date}</td>
		         <td style="text-align:center">${qboard.board_hit}</td>
      		 </tr>
     		 </c:forEach>
      		<tr>
      		<c:choose>         	
	                <c:when test="${principal.user.member_number != null}">	
	                	<td colspan="5"> <a href="qwrite_view" style="text-decoration:none; color:black">글작성</a> </td>           
<%-- 			            <a href="nmodify_view?board_id=${content_view.board_id}">수정</a> &nbsp;&nbsp;
			            <a href="ndelete?board_id=${content_view.board_id}">삭제</a> &nbsp;&nbsp;  --%>
	                </c:when>
	                <c:otherwise></c:otherwise>
	            </c:choose>
         <!-- <td colspan="5"> <a href="qwrite_view">글작성</a> </td> -->
      	</tr>  	
				     
			</tbody>
		<br>
		</table>
		
		<div class="paging">		
			<c:if test="${pageMaker.pre}">
				<a href="qlist${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
			</c:if>		   
			<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<a href="qlist${pageMaker.makeQuery(idx)}" style="text-decoration:none; color:black">${idx}&nbsp;&nbsp;</a>
			</c:forEach>			      
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="qlist${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
			</c:if> 
		</div>		
	<div>
	
	<br><br><br>	

</body>
</html>
