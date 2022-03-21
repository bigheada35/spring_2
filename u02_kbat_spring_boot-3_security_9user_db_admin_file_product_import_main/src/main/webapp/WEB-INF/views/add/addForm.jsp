<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>유저 회원가입</title>
</head>

<body>

<h1>유저 회원가입</h1>

<c:url value="/add/addUser" var="addUserUrl" />
<p>${addUserUrl}</p>
<form:form name="frmMember" action="${addUserUrl}" method="POST">
    <p>
        <label for="member_id">아이디</label>
        <input type="text"  name="member_id" />
    </p>
    <p>
        <label for="password">비밀번호</label>
        <input type="password" name="password"/>
    </p>
    <p>
        <label for="member_name">이름</label>
        <input type="text" name="member_name"/>
    </p>
    <p>
        <label for="member_phone">전화</label>
        <input type="text" name="member_phone"/>
    </p>  
     <p>
        <label for="member_email">이메일</label>
        <input type="text" name="member_email"/>
    </p> 
    <p>
        <label for="member_address">주소</label>
        <input type="text" name="member_address"/>
    </p>
    <p>
        <label for="member_company">회사</label>
        <input type="text" name="member_company"/>
    </p> 
    <button type="submit" class="btn">가입하기</button>
</form:form>
</body>
</html>