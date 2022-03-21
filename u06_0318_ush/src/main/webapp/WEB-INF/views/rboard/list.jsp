<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
/* ratingToPercent() {
    const score = +this.restaurant.averageScore * 20;
    return score + 1.5;
} */
</script>
<body>  
   <table width="500" cellpadding="0" cellspacing="0" border="1">
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
      <tr>
         <td>${board.board_id}</td>       
         <td>
            <a href="rcontent_view?board_id=${board.board_id}">${board.board_title}</a></td>
         <%-- <td>${board.boardtype_id}</td>  --%>
         <td>${board.member_id}</td>
         <td>${board.board_date}</td>
         <td>${board.rating_check}</td>
         <td>${board.board_hit}</td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="10"><a href="rwrite_view">글작성</a> </td>
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
	</c:if> <br>


</body>
</html>