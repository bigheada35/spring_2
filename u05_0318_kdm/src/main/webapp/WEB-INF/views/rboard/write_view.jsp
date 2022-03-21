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

</script>
<style>
/* .blind {
  position: absolute;
  overflow: hidden;
  margin: -1px;
  padding: 0;
  width: 1px;
  height: 1px;
  border: none;
  clip: rect(0, 0, 0, 0);
}

.startRadio {
  display: inline-block;
  overflow: hidden;
  height: 40px;
  &:after {
    content: "";
    display: block;
    position: relative;
    z-index: 10;
    height: 40px;
    background: url('${pageContext.request.contextPath}/resources/img/star.png');
    background-size: contain;
    pointer-events: none;
  }
  &__box {
    position: relative;
    z-index: 1;
    float: left;
    width: 20px;
    height: 40px;
    cursor: pointer;
    input {
      opacity: 0 !important;
      height: 0 !important;
      width: 0 !important;
      position: absolute !important;

      &:checked + .startRadio__img {
        background-color: #0084ff;
      }
    }
  }
  &__img {
    display: block;
    position: absolute;
    right: 0;
    width: 500px;
    height: 40px;
    pointer-events: none;
  }
} */
</style>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">	
     <form:form action="rwrite" method="post">               
         <!-- <div class="startRadio">
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 1개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 2개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 3개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 4개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 5개</span></span>
			</label>
			<label class="startRadio__box">
			<input type="radio" name="star" id="">
			<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
			</label>
		</div> -->
		
		<tr>
			<!-- <td class="form-inline">  -->
			    <input type="radio" name="rating_check" id="rating_check" value="1" class="radio" /><span class="ml_10">1점</span>
			    <input type="radio" name="rating_check" id="rating_check" value="2" class="radio" /><span class="ml_10">2점</span>
			    <input type="radio" name="rating_check" id="rating_check" value="3" class="radio" /><span class="ml_10">3점</span>
			    <input type="radio" name="rating_check" id="rating_check" value="4" class="radio" /><span class="ml_10">4점</span>
			    <input type="radio" name="rating_check" id="rating_check" value="5" class="radio" /><span class="ml_10">5점</span>
			<!-- </td> --> 
		</tr>
		
         <tr>
            <td> 제목 </td>
            <td> <input type="text" name="board_title" size = "50"> </td>
         </tr>
         <tr> 
            <td> 내용 </td>
            <td> <textarea name="board_content" rows="10" ></textarea> </td>
         </tr>

                                <div class="f_box">
                                        <!-- <label for="img">사진첨부</label>
                                        <input type="file" id="img"  name="bf_file[]"> -->
                                        
                                        <label for="myfile">파일 첨부</label>
    									<input type="file" name="myfile">
                                </div>


                       <!-- <script>
                            // 이미지 업로드
                            $('#img').on('change', function() {
                            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
                            //배열에 추출한 확장자가 존재하는지 체크
                            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                                resetFormElement($(this)); //폼 초기화
                                window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
                            } else {
                                file = $('#img').prop("files")[0];
                                blobURL = window.URL.createObjectURL(file);
                                $('#image_preview img').attr('src', blobURL);
                                $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
                                $(this).slideUp(); //파일 양식 감춤
                            }
                            });
 						</script> -->
         <tr>             
            <td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; 
            <a href="rlist">목록보기</a></td>
         </tr>                 
      </form:form>     
   </table>  
</body>
</html>