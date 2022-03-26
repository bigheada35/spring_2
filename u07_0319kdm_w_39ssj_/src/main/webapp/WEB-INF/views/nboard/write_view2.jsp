<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<style>
	.table{
		margin-left : 20%;
		width : 60%;
	}

	.write{
		width : 100%
	}
</style>
<body>
<%-- <table width="500" cellpadding="0" cellspacing="0" border="1">
<sec:authorize access="hasAuthority('ROLE_ADMIN')"></sec:authorize>--%>
      <br>
	<div class="container">
		<table class="table"> 
			<input type="hidden" name="board_id" value="${content_view.board_id}">
			<input type="hidden" name="board_hit" value="${content_view.board_hit}">
			<input type="hidden" name="board_title" value="${content_view.board_title}"> 
			<thead> 
			    <tr>  
			      <th scope="col">제목</th>
			      <td><input type="text" name="board_title" class="write"></td>
			    </tr>
			    <tr>  
			      <th scope="col">작성자</th>
			      <td>${principal.user.member_id}</td>
			    </tr>

			    <tr style="border-bottom:2px solid">   
			      <th scope="col" class="content">내용</th>
			      <td><textarea rows="10" name="board_content" style="width:100%"></textarea></td>
			    </tr>   
			</thead>			
		</table>		
		<tr>
            <td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; 
            <a href="nlist">목록보기</a></td>
         </tr>
      
      </div>
      
      
     <%--  <form action="nwrite" method="post">
         <tr>
            <td> 제목 </td>
            <td> <input type="text" name="board_title" size = "50"> </td>
         </tr>
         <tr> 
            <td> 내용 </td>
            <td> <textarea name="board_content" rows="10" ></textarea> </td>
         </tr>
         <tr>
            <td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; 
            <a href="nlist">목록보기</a></td>
         </tr>
      </form>
   </table>  --%>
</body>

</html>