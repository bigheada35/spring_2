<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>크리에이터 회원가입</title>
</head>

<body>

<h1>크리에이터 회원가입</h1>


<c:url value="/add/addAdmin" var="addAdminUrl" />
<p>${addAdminUrl}</p>

<form:form name="frmMember" action="${addAdminUrl}" method="POST">
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

<br/>
<br/>
 
<form:form name="frmAdmin" action="${addUserUrl}" method="POST" enctype="multipart/form-data">
	<p>
    	<label for="myfile">사업자등록증</label>
    	<input type="file" name="myfile">
    </p>
    <button type="submit">제출하기</button>	
</form:form>

</body>
</html>