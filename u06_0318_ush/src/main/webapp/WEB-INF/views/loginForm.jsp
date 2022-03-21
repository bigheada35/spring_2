<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인페이지</h1>

<form action="/login" method="POST">
<input type="text" name="username"/><br>
<input type="password" name="password"/><br>
<button>로그인</button>
</form>

<a href="/add/addForm">회원가입</a>
<a href="/oauth2/authorization/google">구글 로그인</a>
<a href="/oauth2/authorization/naver">네이버 로그인</a>
<a href="/oauth2/authorization/kakao">카카오 로그인</a>

</body>
</html>