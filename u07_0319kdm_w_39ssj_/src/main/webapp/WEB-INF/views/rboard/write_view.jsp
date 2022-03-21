<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table width="800" cellpadding="0" cellspacing="0" border="1">	
     <form:form action="rwrite" method="post" enctype="multipart/form-data">               
       		
		<tr>
			<td class="form-inline"> 
			    <input type="radio" name="rating_check" id="rating_check" value="★☆☆☆☆" class="radio" /><span class="ml_10">★☆☆☆☆</span>
			    <input type="radio" name="rating_check" id="rating_check" value="★★☆☆☆" class="radio" /><span class="ml_10">★★☆☆☆</span>
			    <input type="radio" name="rating_check" id="rating_check" value="★★★☆☆" class="radio" /><span class="ml_10">★★★☆☆</span>
			    <input type="radio" name="rating_check" id="rating_check" value="★★★★☆" class="radio" /><span class="ml_10">★★★★☆</span>
			    <input type="radio" name="rating_check" id="rating_check" value="★★★★★" class="radio" /><span class="ml_10">★★★★★</span>
			</td> 
		</tr> 
			
			<label for="img">파일 업로드</label> 
						<img src="<c:url value="${rwrite_view.attachment_name}"/>" />
						<input type="file" name="file" >
		
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
            <a href="rlist">목록보기</a></td>
         </tr>                 
      </form:form>     
   </table>  
</body>
</html>