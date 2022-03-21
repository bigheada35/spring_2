<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form:form action="rmodify" method="post">
			<input type="hidden" name="board_id" value="${rmodify_view.board_id}">
			<tr>
				<td>번호</td>
				<td>${rmodify_view.board_id}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${rmodify_view.board_hit}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${rmodify_view.member_id}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title"
					value="${rmodify_view.board_title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" name="board_content">${rmodify_view.board_content}</textarea></td>
			</tr>
			<tr>
           		<td colspan="2"> <input type="submit" value="수정"></button> &nbsp;&nbsp; 
            	<a href="rlist">목록</a> &nbsp;&nbsp;            
        	</tr>		
		</form:form>
	</table>
</body>
</html>