<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="rboard/write_view.js">


</script>
<body>
   <table width="500" cellpadding="0" cellspacing="0" border="1">
      <form:form action="rmodify_view" method="post">
         <input type="hidden" name="board_id" value="${rcontent_view.board_id}">
         <input type="hidden" name="board_hit" value="${rcontent_view.board_hit}">
         <input type="hidden" name="board_title" value="${rcontent_view.board_title}">
         
         <tr>
            <td> 번호 </td>
            <td> ${rcontent_view.board_id} </td>
         </tr>
         <tr>
            <td> 조회수 </td>
            <td> ${rcontent_view.board_hit} </td>
         </tr>
         <tr>
            <td> 작성자 </td>
            <td> ${rcontent_view.member_id} </td>
            <%-- <td> <input type="text" name="member_id" value="${content_view.member_id}"></td> --%>
         </tr>
         <tr>
            <td> 제목 </td>
            <td> ${rcontent_view.board_title} </td>
           <%--  <td> <input type="text" name="board_title" value="${content_view.board_title}"></td> --%>
         </tr>         
         <tr>
            <td> 내용 </td>
            <td> <textarea rows="10" name="board_content" >${rcontent_view.board_content}</textarea></td>
         </tr>
         	<td>사진</td>
         	<td>${rcontent_view.attachment_name}</td>
         <tr>
<!--             <td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp;  -->
           <td colspan="2"> <a href="rlist">목록</a> &nbsp;&nbsp;             
            <a href="rmodify_view?board_id=${rcontent_view.board_id}">수정</a> &nbsp;&nbsp;
            <a href="rdelete?board_id=${rcontent_view.board_id}">삭제</a> &nbsp;&nbsp; 
         </tr>
      </form:form>
   </table>
   
</body>
</html>