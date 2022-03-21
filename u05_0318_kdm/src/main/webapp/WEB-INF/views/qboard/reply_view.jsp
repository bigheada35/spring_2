<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Home</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
      <form:form action="qreply" method="post">
      	 <input type="hidden" name="board_id" value="${qreply_view.board_id}">
      	 <input type="hidden" name="reply_id" value="${qreply_view.reply_id}">
         <input type="hidden" name="reply_group" value="${qreply_view.reply_group}">
         <input type="hidden" name="reply_step" value="${qreply_view.reply_step}">
         <input type="hidden" name="reply_indent" value="${qreply_view.reply_indent}">
         <tr>
            <td> 제목 </td>
            <td> <input type="text" name="board_title" value="${qreply_view.board_title}"> </td>
         </tr>
         <tr> 
            <td> 내용 </td>
            <td><textarea rows="10" name="board_content" >${qreply_view.board_content}</textarea></td>
         </tr>
         <tr>
            <td colspan="2"> <input type="submit" value="답변"> &nbsp;&nbsp; 
            <a href="qlist">목록보기</a></td>
         </tr>
      </form:form>
   </table>  
</body>
</html>