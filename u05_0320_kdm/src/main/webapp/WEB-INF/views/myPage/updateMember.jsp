<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>회원정보수정</title>

<script type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

	<h1>회원정보 수정</h1>
	<form action="/myPage/updateMember/insert" method="post">

		<p>
			<label for="member_id">아이디</label> <input type="text"
				name="member_id" />
		</p>
		<p>
			<label for="password">비밀번호</label> <input type="password"
				name="password" />
		</p>
		<p>
			<label for="member_name">이름</label> <input type="text"
				name="member_name" />
		</p>
		<p>
			<label for="member_phone">전화</label> <input type="text"
				name="member_phone" />
		</p>
		<p>
			<label for="member_email">이메일</label> <input type="text"
				name="member_email" />
		</p>
		<p>
			<label for="member_address">주소</label> <input type="text"
				name="member_address" />
		</p>
		<p>
			<label for="member_company">회사</label> <input type="text"
				name="member_company" />
		</p>
		<button id="update-btn" type="submit" class="site-btn register-btn"
			style="font-size: 15pt">수정완료</button>
		<br> <br>
		<hr>
		<br>
		<button id="point-btn" type="submit" class="float-right"
			style="font-size: 10pt;" onclick="deleteMember()">회원탈퇴</button>
	</form>
	<br>



</body>


<script>
function deleteMember(){
	event.preventDefault();
	if(confirm("회원이 작성한 게시물과 회원의 모든 정보가 삭제됩니다. 정말 탈퇴하시겠습니까? ") ==true){
		alert("탈퇴 실행")
		$.ajax({
			method : "get",
			url : "/myPage/updateMember/delete",
			success : function(data) {
				alert("회원탈퇴가 정상적으로 완료되었습니다. 로그인 창으로 이동합니다.");
				window.location.href = '/logout';
			}
		});
	}
	
	
}

</script>
</html>