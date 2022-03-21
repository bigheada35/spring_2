<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form:form action="qmodify_view" method="post">
			<input type="hidden" name="board_id" value="${qcontent_view.board_id}">
			<input type="hidden" name="reply_group" value="${qcontent_view.reply_group}"> 
			<input type="hidden" name="reply_step" value="${qcontent_view.reply_step}"> 
			<input type="hidden" name="reply_indent" value="${qcontent_view.reply_indent}"> 
			<input type="hidden" name="board_enable" value="${qcontent_view.board_enable}">
			<tr>
				<td>번호</td>
				<td>${qcontent_view.board_id}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${qcontent_view.board_hit}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${qcontent_view.member_id}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${qcontent_view.board_title}</td>				
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" name="board_content">${qcontent_view.board_content}</textarea></td>
			</tr>
			<tr>				
				<td colspan="2"><a href="qlist">목록</a> &nbsp;&nbsp; 
				<a href="qmodify_view?board_id=${qcontent_view.board_id}">수정</a>
				<a href="qreply_view?board_id=${qcontent_view.board_id}&reply_group=${qcontent_view.reply_group}
				&reply_step=${qcontent_view.reply_step}&reply_indent=${qcontent_view.reply_indent}">답변</a>
				<a href="qdelete?board_id=${qcontent_view.board_id}">삭제</a>
			</tr>
		</form:form>
	</table>	
</body>
</html>