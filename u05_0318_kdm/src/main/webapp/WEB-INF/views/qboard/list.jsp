<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>     	 
   <table width="500" cellpadding="0" cellspacing="0" border="1">  
      <tr>
         <td>번호</td>
         <td>제목</td>
         <td>작성자</td>
         <td>작성일자</td>
         <td>조회수</td>
      </tr>
      <c:forEach items="${qlist}" var="board">
      <tr>
       	 <input type="hidden" name="reply_group" value="${board.reply_group}">
       	 <input type="hidden" name="board_enable" value="${board.board_enable}">
         <td>${board.board_id}</td>           
         <td>                 	
	        <c:if test="${board.board_enable=='N'}">
	            <img src="${pageContext.request.contextPath}/resources/img/starrate.png"/>
	            <c:choose>
	                <c:when test="${board.member_id eq principal.user.member_id || principal.user.member_number == '38'}">	
	                	<c:forEach begin="1" end="${board.reply_indent}">[답변]</c:forEach>
	        			<a href="qcontent_view?board_id=${board.board_id}&reply_group=${board.reply_group}"><c:out value="${board.board_title}"/></a>	          
	                </c:when>
	                <c:otherwise>비밀글은 작성자와 크리에이터만 볼 수 있습니다.</c:otherwise>
	            </c:choose>
	       	 </c:if>
	        <c:if test="${board.board_enable == 'Y'}" >
	        	<c:forEach begin="1" end="${board.reply_indent}">[답변]</c:forEach>
	        	<a href="qcontent_view?board_id=${board.board_id}&reply_group=${board.reply_group}">
	        	<c:out value="${board.board_title}"/></a>
	        </c:if>	
         	</td>
         <td>${board.member_id} </td>      
         <td>${board.board_date}</td>
         <td>${board.board_hit}</td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="5"> <a href="qwrite_view">글작성</a> </td>
      </tr>                
   </table>  
   <c:if test="${pageMaker.pre}">
         <a href="qlist${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
   </c:if>

	<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
	<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
		<a href="qlist${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>
	      
	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<a href="qlist${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
	</c:if> <br>
</body>
</html>