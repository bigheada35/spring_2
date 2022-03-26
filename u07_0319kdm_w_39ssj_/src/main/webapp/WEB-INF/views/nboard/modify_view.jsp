<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	.input-group{
		margin-left : 15%;
		width : 70%;
	}
	
	.table{
		margin-left : 20%;
		width : 60%;
	}
	
 	<%--.content{
		position : relative;
		bottom : 230px;
		border-bottom : none;
	} --%>
	
	.button{
		margin-left : 20%;
		text-align : left;
	}
	
	#b-list{
		
	}
	
	.title{
		width : 100%;
	}
</style>
<body>
	<br>
	<div class="container">
		<table class="table"> 
			<form:form action="nmodify" method="post">
			<input type="hidden" name="board_id" value="${modify_view.board_id}">
			<thead> 
			   	<tr>
			      <th scope="col">번호</th>
			      <td>${modify_view.board_id}</td>
			    </tr>			    
			    <tr>  
			      <th scope="col">작성자</th>
			      <td>${modify_view.member_id}</td>
			    </tr>
			    <tr>  
			      <th scope="col">작성일자</th>
			      <td>${modify_view.board_date}</td>
			    </tr>
			    <tr>   
			      <th scope="col">조회수</th>
			      <td>${modify_view.board_hit}</td>
			    </tr>   
			    <tr>  
			      <th scope="col">제목</th>			      
			      <td><input type="text" name="board_title" class="title" value="${modify_view.board_title}"></td>
			    </tr>
			    <tr style="border-bottom:2px solid">   
			      <th scope="col" class="content">내용</th>
			      <td><textarea rows="10" name="board_content" style="width:100%" value="${modify_view.board_content}">${modify_view.board_content}</textarea></td>
			    </tr>   
			</thead>
		</table>		
		<div class="button">
			<c:choose>         	
				<c:when test="${principal.user.member_id == 'kbatc5'}">	
					<a href="nlist"><button type="button" class="btn btn-dark" id="b-list">목록</button></a>         
					<button type="submit" class="btn btn-dark">수정</button></a>
				</c:when>
				<c:otherwise><a href="nlist"><button type="button" class="btn btn-dark">목록</button></a></c:otherwise>
			</c:choose>
		</div>
			</form:form>		
	</div>
</body>
</html>