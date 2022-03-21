<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Home</title>
<script type="text/javascript">
	 	
</script>
</head>
<body>
				  	
	<table width="500" cellpadding="0" cellspacing="0" border="1">

		<form action="qwrite" method="post">
		<tr>
			<td class="form-inline">
			    <input type="radio" name="board_enable" id="board_enable" value="Y" class="radio" /><span class="ml_10">공개</span>
			    <input type="radio" name="board_enable" id="board_enable" value="N" class="radio" /><span class="ml_10">비공개</span>
			</td>
		</tr>	
		<tr>
			<td>제목</td>
			<td><input type="text" name="board_title" size="50"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="board_content" rows="10"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="입력">
				&nbsp;&nbsp; <a href="qlist">목록보기</a></td>
		</tr>
		</form>
	</table>
</body>
</html>