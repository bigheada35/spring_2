<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>마이 페이지</title>
</head>

<body>

	<h1>마이 페이지 입니다.</h1>

	<p>
		principal:
		<sec:authentication property="principal" />
	</p>
	<p>
		아이디:
		<sec:authentication property="principal.user.member_id" />
	</p>
	<p>
		비밀번호:
		<sec:authentication property="principal.user.password" />
	</p>
	<p>
		이름:
		<sec:authentication property="principal.user.member_name" />
	</p>
	<p>
		전화:
		<sec:authentication property="principal.user.member_phone" />
	</p>
	<p>
		이메일:
		<sec:authentication property="principal.user.member_email" />
	</p>
	<p>
		주소:
		<sec:authentication property="principal.user.member_address" />
	</p>
	<p>
		회사:
		<sec:authentication property="principal.user.member_company" />
	</p>
	<p>
		<a href="<c:url value="/" />">홈</a>
	</p>


	<p>

		<c:if test="${member.member_id eq principal.user.member_id}">
			<div class="profile-info__actions" style="padding-top: 50px;">
				<a class="btn" href="/myPage/updateMember">회원정보 수정</a>
			</div>
		</c:if>
	</p>
	<c:if test="${member.member_id eq principal.user.member_id}">
		<div class="profile-info__actions" style="padding-top: 50px;">
			<a class="btn" href="/myPage/myOrderList">주문내역</a>
		</div>
	</c:if>


</body>
</html>