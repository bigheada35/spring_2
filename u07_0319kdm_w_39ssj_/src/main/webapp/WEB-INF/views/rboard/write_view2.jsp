<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	/* var fileInput = document.getElementById("fileInput");
	//값이 변경될때 호출 되는 이벤트 리스너
	fileInput.addEventListener('change',function(e){
	  var file = e.target.files[0]; //선택된 파일
	  var reader = new FileReader();
	  reader.readAsDataURL(file); //파일을 읽는 메서드 
	
	  reader.onload = function fileuplode(){
	    var photoFrame = document.createElement("div");
	    photoFrame.style = `background : url(${reader.result}); background-size : cover`;
	    photoFrame.className = "photoFrame";
	    document.getElementById("pictures").appendChild(photoFrame);
	    e.target.value = "";
	
	    photoFrame.addEventListener("click",function(){
	      document.getElementById("pictures").removeChild(photoFrame);
	    })
	  }
	}) */

</script>
<style>

</style>
</head>
<body>


<table width="500" cellpadding="0" cellspacing="0" border="1">	

      <form:form action="rwrite" method="post">               
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
         <tr>
         	<label for="myfile">파일 첨부</label>
    		<input type="file" name="myfile">
	    	<!-- <input type="file" class="ex_file" name="ex_file" onchange="fileUpload()" multiple> -->
    	 </tr>
      </form:form>
      
      <%-- <form:form name="frmAdmin" action="${addUserUrl}" method="POST" enctype="multipart/form-data">
	<p>
    	<label for="myfile">파일 첨부</label>
    	<input type="file" name="myfile">
    </p>
    <button type="submit">제출하기</button>	
</form:form> --%>
   </table>  
</body>
</html>