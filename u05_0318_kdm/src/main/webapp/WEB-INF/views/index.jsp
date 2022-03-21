<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h1>메인페이지</h1>

<sec:authorize access="isAnonymous()">
   <p><a href="<c:url value="/login" />">로그인</a></p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
   <form:form action="${pageContext.request.contextPath}/logout" method="POST">
       <input type="submit" value="로그아웃" />
   </form:form>
</sec:authorize>

<h3>
    [<a href="<c:url value="/add/addForm" />">회원가입</a>]
    [<a href="<c:url value="/add/addFormAdmin" />">크리에이터 회원가입</a>]
    [<a href="<c:url value="/user/userHome" />">유저 홈</a>]
    [<a href="<c:url value="/admin/adminHome" />">관리자 홈</a>]
    [<a href="<c:url value="/myPage/myHome" />">마이페이지</a>]
    [<a href="<c:url value="/statistics/income" />">매출 통계</a>]
</h3>
<a href="/oauth2/authorization/google">구글 로그인</a>
<a href="/oauth2/authorization/naver">네이버 로그인</a>
<a href="/oauth2/authorization/kakao">카카오 로그인</a>
</body>
</html>
