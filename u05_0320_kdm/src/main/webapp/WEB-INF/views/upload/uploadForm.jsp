<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>업로드 폼 및 현재 리스트</title>
</head>

<body>
		<p>"${message}"</p>
	
	<form:form enctype="multipart/form-data" action="fileUpload" method="POST">
	
	    <input type="radio" id="contactChoice1" name=category_name value="음악" checked>
    	<label for="contactChoice1">음악</label>

	    <input type="radio" id="contactChoice2" name="category_name" value="취미">
    	<label for="contactChoice2">취미</label>

    	<input type="radio" id="contactChoice3" name="category_name" value="가드닝">
    	<label for="contactChoice3">가드닝</label>
    	
	    <input type="radio" id="contactChoice4" name=category_name value="부동산">
    	<label for="contactChoice4">부동산</label>
		<br/>
 
        <label for="product_price">상품가격</label>
        <input type="text"  name="product_price" placeholder="숫자 입력" size="5"/>	<br/>
      
        <label for="product_description">상품설명</label>
        <input type="text"  name=product_description placeholder="글자로 입력하세요" size="100"/><br/>
             		
        <label for="fileVideo">동영상</label>
		<input type="file" name="fileVideo"/>
		<label for="fileImage">사진</label>
		<input type="file" name="fileImage" />
		<button type="submit" class="btn">파일업로드 및 상품등록</button>
	</form:form>
	
	<p>files</p>
	<table width="1000" cellpadding="0" cellspacing="0" border="1">
		<%-- <c:forEach items="${files}" var="file"> --%>
		<c:forEach items="${products}" var="prod">
		<tr>
	 	 			 
	 				<td>
	 					<video width="300" height="250" controls/>
			          		<%-- <source src="<c:url value="${file}"/>" type="video/mp4"> --%>
			          		<source src="<c:url value="${prod.video_name}"/>" type="video/mp4">
					    </video>
					    ${prod.video_name}
					<td/>
					<%-- <td>${file} </td> --%>
					<%-- <td>${prod.video_name} </td> --%>
					<td>${prod.product_name} </td>
					<td>${prod.product_price} </td>
					<td>${prod.product_enable} </td>
					<td>${prod.product_date} </td>
					<td style="min-width:200px;">${prod.product_description} </td>
					<td>
						<img src="<c:url value="${prod.image_name}"/>" style="max-width:250px;"/>
					${prod.image_name} </td>
					<td>
						<a href="/upload/delete?product_id=${prod.product_id}">삭제</a> 
					</td>
	
		 </tr>
		</c:forEach>	
	</table>
	
</body>
</html>