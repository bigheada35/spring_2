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

	<!-- Required CSS files -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
	<link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">
	<link rel="stylesheet" href="/resources/assets/css/barfiller.css">
	<link rel="stylesheet" href="/resources/assets/css/animate.css">
	<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/assets/css/slicknav.css">
	<link rel="stylesheet" href="/resources/assets/css/main.css">
	<link rel="stylesheet" href="/resources/bootstrap.min.css">
	
	<!-- AJAX 처리용 JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
</head>

<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<hr style="margin: 15px 15px 40px 15px;">
		
<!-- 상단 회원 정보 요약 -->
		<div class="container">
			<div class="row" style="height: 50px;">
				<div class="col-md-3 contact-info" align="left" style="padding-left: 15px; margin-top: 10px; text-align: center;">
					<h2> <sec:authentication property="principal.user.member_name"/></h2>
				</div>
				<div class="col-md-1 contact-info" style="padding-top: 20px;">
					<a href="${pageContext.request.contextPath}/myPage/updateMember">정보수정</a>
				</div>
				<div class="col-md-6 contact-info"></div>
				<button id="point-btn" type="submit" class="float-right"
			style="font-size: 10pt;" onclick="deleteMember()">회원탈퇴</button>
				</div>
			</div>
			<span style="margin-left: 14px;"> </span> <span style="margin-left: 400px;" align="center"> </span>
		</div>

		<hr style="margin: 15px 15px 40px 15px;">

		<div class="container">
			<div class="row">
				<!-- 왼쪽 사이드 메뉴  -->
				<div class="col-md-3 contact-info" align="center">
					<div class="single-info" style="margin-bottom: 40px">
						<h3>나의 쇼핑활동</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/myPage/myOrderList">주문내역 조회</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/recently">최근 본 상품</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/like">찜한 목록</a>
						</h5>
					</div>
					
					<div class="single-info" style="margin-bottom: 40px">
						<h3>내가 쓴 글보기</h3>
						<hr>
						<h5>
							<a href="${pageContext.request.contextPath}/myPage/myReview">구매후기</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/prdctq/list">상품문의</a>
						</h5>
						<h5>
							<a href="${pageContext.request.contextPath}/member/mypage/myqna/list">고객Q&A</a>
						</h5>
					</div>
				</div>
				
				<!-- 오른쪽 컨텐츠 내용 -->
				<div class="col-md-9 contact-info" style="border-left: 1px solid rgba(0, 0, 0, .1);">
					<div class="container">
						<div class="row">
							<div class="col-md-6" align="left" style="padding-left: 10px">
								<h3>최근 주문내역</h3>
							</div>
							<div class="col-md-6" align="right" style="padding-right: 0px">
								<button class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/order/cart'">장바구니</button>
							</div>
						</div>
						<div class="row" style="padding-left: 15px">
							<small>최근 주문내역 중 3개만 보여집니다.</small>
						</div>
						
						<hr>
						
						<!-- 최근 주문내역 3개만 보여주기 -->
						<c:forEach items="${order_list}" var="order" end="2">
						<div class="row">	
							<div class="col-md-3 thumbnail" align="center">
								<a href="${pageContext.request.contextPath}/prdct/${order.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${order.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
							</div>
							<div class="col-md-5" align="left" style="padding: 3% 0px 0px 0px">
								<br>
								<h5>${order.brand_id}</h5>
								<h5>${order.prdct_name}</h5>
							</div>
							<div class="col-md-4" align="right" style="padding: 3% 0px 0px 0px">
								<br>
								<h2>${order.order_price}원</h2>
								<!-- 배송조회페이지 URI 설정할것 -->
								<c:choose>
									<c:when test="${order.order_state_number eq 1}">
										<h4>결제대기</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 2}">
										<h4>결제완료</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 3}">
										<h4>주문요청</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 4}">
										<h4>배송대기</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 5}">
										<h4>배송중</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소</button>
									</c:when>
									<c:when test="${order.order_state_number eq 6}">
										<h4>배송완료</h4>
										<button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#mdal">배송조회</button>&nbsp;
										<button type="button" class="btn btn-success btn prdconfirm${order.order_number}" data-rno="${order.order_number}">주문확정</button><br>
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button>
										<!-- 주문확정 버튼을 누르면 배송완료에서 주문확정 상태로 변한다 -->
										<script type="text/javascript">
											$(document).ready(function (){
												$('.prdconfirm${order.order_number}').click(function(event){
													event.preventDefault();
															
													if (confirm("주문확정 하시겠습니까?")) {
														// FormData 객체 생성
														var formData = new FormData();
																
														// button의 data-rno 값을 가져온다
														var order_number = $(this).attr("data-rno");		
														console.log("order_number: " + order_number);
													     		
												     	// formData에 해당 데이터를 append한다
												     	var form = {
												     		order_number: order_number
													    };
													    console.log("form: " + form);
													 
														$.ajax({
															type : 'POST', 
															url : $(this).attr("href"), 
															cache : false, 
															contentType:'application/json; charset=utf-8',
													        processData: false, 
													        data: JSON.stringify(form), 
													        beforeSend : function(xhr) {
																xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
													        },
															success: function(result) {
																console.log(result);
																console.log("PRDCT_STATE_CHANGED!");
																$(location).attr('href', '${pageContext.request.contextPath}/member/mypage');
															},
															error:function(e) {		
																console.log(e);
																alert("주문확정 하실 수 없습니다");
																location.reload();
															}
														})
													} else {
														location.reload();
													}
												});	
											});	
											</script>
									</c:when>
									<c:when test="${order.order_state_number eq 7}">
										<h4>주문확정</h4>
										<button type="button" class="btn btn-primary btn" onclick="window.location.href='${pageContext.request.contextPath}/member/mypage/review/${order.prdct_id}/write'">리뷰쓰기</button>&nbsp;
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">교환요청</button><br>
										<button type="button" class="btn btn-danger btn" onclick="location.href='${pageContext.request.contextPath}/'">환불요청</button>
									</c:when>
									<c:when test="${order.order_state_number eq 8}">
										<h4>주문취소</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">주문취소조회</button>
									</c:when>
									<c:when test="${order.order_state_number eq 9}">
										<h4>교환요청</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">교환조회</button>
									</c:when>
									<c:when test="${order.order_state_number eq 10}">
										<h4>환불요청</h4>
										<button type="button" class="btn btn-primary btn" onclick="location.href='${pageContext.request.contextPath}/'">환불조회</button>
									</c:when>
									<c:otherwise>
										<h4>환불완료</h4>
									</c:otherwise>
								</c:choose>
								<%-- 모달 영역 --%> 
								<div class="modal fade myModal" id="mdal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&#88;</span></button>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<label id="tekbeCompnayName">택배회사명</label>
													<select id="tekbeCompnayList" class="form-control" name="tekbeCompnayList"></select>
												</div>
												<div>
													<label id="tekbeCompnayName">운송장번호</label>
													<input type="text" id="invoiceNumberText" class="form-control"  name="invoiceNumberText"><br/><br/>
												</div>
												<button id="myButton1" class="btn btn-primary">택배 조회하기 </button><br/><br/>
												<div>
													<table id="myPtag"></table>
												</div>
												<br/>
												<div>
													<table id="myPtag2"></table>
												</div>
											</div>
											<div class="modal-footer">
												<div align="left"></div>
											</div>
										</div>
									</div>
								</div>	
							</div>
						</div>
						<hr>
						</c:forEach>
						
						<br style="padding: 0px 0px 5% 0px">
						
						<div class="row" style="padding-left: 15px">
							<h3>최근 본 상품</h3>
						</div>
						<div class="row" style="padding: 15px 0px 0px 15px">
							<small>최근 본 상품 중 3개만 보여집니다.</small>	
						</div>
						
						<hr>
						
						<!-- 최근 본 상품내역 3개만 보여주기 -->
						<div class="row">
							<c:forEach items="${view_list}" var="watch" end="2">	
							<div class="col-md-4 thumbnail" align="center">
								<div>
									<!-- 경로 prdct_img/prdct_thumbnail로 바뀌면 수정하자... -->
									<a href="${pageContext.request.contextPath}/prdct/${watch.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${watch.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
								</div>
								<div style="padding-top: 3%">
									<h5>${watch.brand_id}</h5>
									<h5>${watch.prdct_name}</h5>
								</div>
							</div>
							</c:forEach>
						</div>
						
						<hr style="padding: 0px 0px 5% 0px">
						
						<div class="row" style="padding-left: 15px">
							<h3>최근 찜한 목록</h3>
						</div>
						<div class="row" style="padding: 15px 0px 0px 15px">
							<small>최근 찜한 목록 중 3개만 보여집니다.</small>	
						</div>
						
						<hr>
						
						<!-- 최근 찜한 목록내역 3개만 보여주기 -->
						<div class="row">
							<c:forEach items="${like_prdct_list}" var="like" end="2">
							<div class="col-md-4 thumbnail" align="center">
								<div>
									<!-- 경로 prdct_img/prdct_thumbnail로 바뀌면 수정하자... -->
									<a href="${pageContext.request.contextPath}/prdct/${like.prdct_id}"><img src="<c:url value="/prdct_img/prdct_thumbnail/${like.prdct_thumbnail}"/>" onerror="this.src='/prdct_img/prdct_thumbnail/none-thumbnail.png'" width="150px" height="200px"></a>
								</div>
								<div style="padding-top: 3%">
									<h5>${like.mbr_id}</h5>
									<h5>${like.prdct_name}</h5>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>	
				</div>
			</div>
			
			<hr style="padding: 15px 0px 15px 0px;">
	

	<hr>
		<!--Required JS files-->
		<script src="/resources/assets/js/jquery-2.2.4.min.js"></script>
		<script src="/resources/assets/js/vendor/popper.min.js"></script>
		<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
		<script src="/resources/assets/js/vendor/owl.carousel.min.js"></script>
		<script src="/resources/assets/js/vendor/isotope.pkgd.min.js"></script>
		<script src="/resources/assets/js/vendor/jquery.barfiller.js"></script>
		<script src="/resources/assets/js/vendor/loopcounter.js"></script>
		<script src="/resources/assets/js/vendor/slicknav.min.js"></script>
		<script src="/resources/assets/js/active.js"></script>
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