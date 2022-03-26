<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>마이 페이지</title>

<!-- Required CSS files -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="/resources/assets/css/barfiller.css">
<link rel="stylesheet" href="/resources/assets/css/animate.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/slicknav.css">
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link rel="stylesheet" href="/resources/bootstrap.min.css">

<!-- AJAX 처리용 JQUERY -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 상품 정렬 -->
<script type="text/javascript">
	// 출처 : http://tonks.tistory.com/79 		
	/* sortingNumber() : 숫자인 실수만으로 되어있을 때, 적용될 함수 */
	function sortingNumber(a, b) {
		if (typeof a == "number" && typeof b == "number")
			return a - b;

		// 천단위 쉼표와 공백문자만 삭제하기.  
		var a = (a + "").replace(/[,\s\xA0]+/g, "", '원');
		var b = (b + "").replace(/[,\s\xA0]+/g, "", '원');

		var numA = parseFloat(a) + "";
		var numB = parseFloat(b) + "";

		if (numA == "NaN" || numB == "NaN" || a != numA || b != numB)
			return false;

		return parseFloat(a) - parseFloat(b);
	}

	/* changeForSorting() : 문자열 바꾸기. */
	function changeForSorting(first, second) {
		// 문자열의 복사본 만들기. 
		var a = first.toString().replace(/[\s\xA0]+/g, " ");
		var b = second.toString().replace(/[\s\xA0]+/g, " ");

		var change = {
			first : a,
			second : b
		};

		if (a.search(/\d/) < 0 || b.search(/\d/) < 0 || a.length == 0
				|| b.length == 0)
			return change;

		var regExp = /(\d),(\d)/g; // 천단위 쉼표를 찾기 위한 정규식. 

		a = a.replace(regExp, "$1" + "$2");
		b = b.replace(regExp, "$1" + "$2");

		var unit = 0;
		var aNb = a + " " + b;
		var numbers = aNb.match(/\d+/g); // 문자열에 들어있는 숫자 찾기 

		for (var x = 0; x < numbers.length; x++) {
			var length = numbers[x].length;
			if (unit < length)
				unit = length;
		}

		var addZero = function(string) { // 숫자들의 단위 맞추기 
			var match = string.match(/^0+/);
			if (string.length == unit)
				return (match == null) ? string : match + string;

			var zero = "0";

			for (var x = string.length; x < unit; x++)
				string = zero + string;

			return (match == null) ? string : match + string;
		};

		change.first = a.replace(/\d+/g, addZero);
		change.second = b.replace(/\d+/g, addZero);

		return change;
	}

	/* byLocale() */
	function byLocale() {
		var compare = function(a, b) {
			var sorting = sortingNumber(a, b);
			if (typeof sorting == "number")
				return sorting;

			var change = changeForSorting(a, b);
			var a = change.first;
			var b = change.second;

			return a.localeCompare(b);
		};

		var ascendingOrder = function(a, b) {
			return compare(a, b);
		};
		var descendingOrder = function(a, b) {
			return compare(b, a);
		};

		return {
			ascending : ascendingOrder,
			descending : descendingOrder
		};
	}

	/* replacement() */

	function replacement(parent) {
		var tagName = parent.tagName.toLowerCase();
		if (tagName == "table")
			parent = parent.tBodies[0];

		tagName = parent.tagName.toLowerCase();
		if (tagName == "tbody")
			var children = parent.rows;
		else
			var children = parent.getElementsByTagName("li");

		var replace = {
			order : byLocale(),
			index : false,
			array : function() {
				var array = [];
				for (var x = 0; x < children.length; x++)
					array[x] = children[x];
				return array;
			}(),
			checkIndex : function(index) {
				if (index)
					this.index = parseInt(index, 10);
				var tagName = parent.tagName.toLowerCase();
				if (tagName == "tbody" && !index)
					this.index = 0;
			},
			getText : function(child) {
				if (this.index)
					child = child.cells[this.index];
				return getTextByClone(child);
			},
			setChildren : function() {
				var array = this.array;
				while (parent.hasChildNodes())
					parent.removeChild(parent.firstChild);
				for (var x = 0; x < array.length; x++)
					parent.appendChild(array[x]);
			},
			ascending : function(index) { // 오름차순 
				this.checkIndex(index);
				var _self = this;
				var order = this.order;
				var ascending = function(a, b) {
					var a = _self.getText(a);
					var b = _self.getText(b);
					return order.ascending(a, b);
				};
				this.array.sort(ascending);
				this.setChildren();
			},
			descending : function(index) { // 내림차순
				this.checkIndex(index);
				var _self = this;
				var order = this.order;
				var descending = function(a, b) {
					var a = _self.getText(a);
					var b = _self.getText(b);
					return order.descending(a, b);
				};
				this.array.sort(descending);
				this.setChildren();
			}
		};
		return replace;
	}

	function getTextByClone(tag) {
		var clone = tag.cloneNode(true); // 태그의 복사본 만들기. 
		var br = clone.getElementsByTagName("br");
		while (br[0]) {
			var blank = document.createTextNode(" ");
			clone.parentNode.insertBefore(blank, br[0]);
			clone.removeChild(br[0]);
		}
		var isBlock = function(tag) {
			var display = "";
			if (window.getComputedStyle)
				display = window.getComputedStyle(tag, "")["display"];
			else
				display = tag.currentStyle["display"];
			return (display == "block") ? true : false;
		};
		var children = clone.getElementsByTagName("*");
		for (var x = 0; x < children.length; x++) {
			var child = children[x];
			if (!("value" in child) && isBlock(child))
				child.innerHTML = child.innerHTML + " ";
		}
		var textContent = ("textContent" in clone) ? clone.textContent
				: clone.innerText;
		return textContent;
	}
</script>
</head>

<body>
	<div style="overflow: hidden;" class="container">
		<!-- header -->
		<hr style="margin: 15px 15px 40px 15px;">
		<!-- 상단 회원 정보 요약 -->
		<div class="container">
			<div class="row" style="height: 50px;">
				<div class="col-md-3 contact-info" align="left"
					style="padding-left: 15px; margin-top: 10px; text-align: center;">
					<h2>
						<sec:authentication property="principal.user.member_name" />
					</h2>
				</div>
				<div class="col-md-1 contact-info" style="padding-top: 20px;">
					<a href="${pageContext.request.contextPath}/myPage/updateMember">정보수정</a>
				</div>
				<div class="col-md-6 contact-info"></div>
				<button id="point-btn" type="submit" class="float-right"
					style="font-size: 10pt;" onclick="deleteMember()">회원탈퇴</button>
			</div>
		</div>
		<span style="margin-left: 14px;"> </span> <span
			style="margin-left: 400px;" align="center"> </span>
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
						<a href="${pageContext.request.contextPath}/myPage/myOrderList">주문내역
							조회</a>
					</h5>
					<h5>
						<a
							href="${pageContext.request.contextPath}/member/mypage/recently">최근
							본 상품</a>
					</h5>
					<h5>
						<a href="${pageContext.request.contextPath}/member/mypage/like">찜한
							목록</a>
					</h5>
				</div>
			
				<div class="single-info" style="margin-bottom: 40px">
					<h3>내가 쓴 글보기</h3>
					<hr>
					<h5>
						<a href="${pageContext.request.contextPath}/myPage/myReview">구매후기</a>
					</h5>
					<h5>
						<a
							href="${pageContext.request.contextPath}/member/mypage/prdctq/list">상품문의</a>
					</h5>
					<h5>
						<a
							href="${pageContext.request.contextPath}/member/mypage/myqna/list">고객Q&A</a>
					</h5>
				</div>
			</div>

			<!-- 컨텐츠 본문 내용 -->
			<div class="col-md-9 contact-info"
				style="border-left: 1px solid rgba(0, 0, 0, .1);">
				<div class="container">
					<div class="row" style="padding-left: 10px">
						<h3>주문내역 조회</h3>
					</div>

					<hr style="padding: 15px 0px 0px 0px">

					<div class="row">
						<table id="product" class="table">
							<thead>
								<tr class="table-secondary">
									<th colspan="2" scope="row"
										style="text-align: center; padding-left: 0px; padding-right: 15px;">
										<h4>상품정보</h4> <br>
									</th>
									<th
										style="text-align: center; padding-left: 0px; padding-right: 25px;">
										<h4>주문일</h4>
										<button class="btn btn-secondary btn-sm"
											onclick="sortTD ( 0 )"
											style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
										<button class="btn btn-secondary btn-sm"
											onclick="reverseTD ( 0 )"
											style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
									</th>
									<th
										style="overflow: auto; text-align: center; padding-left: 0px; padding-right: 0px;">
										<h4>주문번호</h4>
										<button class="btn btn-secondary btn-sm"
											onclick="sortTD ( 1 )"
											style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
										<button class="btn btn-secondary btn-sm"
											onclick="reverseTD ( 1 )"
											style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
									</th>
									<th
										style="text-align: center; padding-left: 15px; padding-right: 15px;">
										<h4>금액</h4>
										<button class="btn btn-secondary btn-sm"
											onclick="sortTD ( 2 )"
											style="padding: 0px 5px 0px 5px; margin: 0px;">▲</button>
										<button class="btn btn-secondary btn-sm"
											onclick="reverseTD ( 2 )"
											style="padding: 0px 5px 0px 5px; margin: 0px;">▼</button>
									</th>
									
									<th
										style="text-align: center; padding-left: 15px; padding-right: 15px;">
									<th
										style="text-align: center; padding-left: 15px; padding-right: 15px;">
										<h4>상태</h4>
										<br>
							   			</th>
							   		</tr>
							   	</thead>
										
							<tbody>
								<c:forEach items="${order_list}" var="order" varStatus="status">
									<tr class="table-secondary">
									<td	style="text-align: left; padding-left: 0px; padding-right: 0px;">
									
						<a href="/main/playVideo?product_id=${order.product_id}" class="btn btn-primary my-2"><img src="<c:url value="${order.image_name}"/>" style="max-width:100px;"/>
					 </td>
											   		<td style="text-align: left; padding-left: 0px; padding-right: 0px;">
								   			<h4 style="padding-bottom: 5px;">${order.orders_id}</h4>
											<h6 style="max-width: 180px; padding-bottom: 5px;">${order.product_description}</h6>
											<h6>
												${order.product_description}
											
											</h6>
										<%-- 주문일(정렬대상) --%>
										<td style="text-align: left; padding: 60px 0px 0px 0px;">
											<h6>${order.orders_date}</h6>
										</td>
										<%-- 주문번호(정렬대상) --%>
										<td style="text-align: center; padding: 60px 0px 0px 0px;">
											<h6>${order.orders_id}</h6>
										</td>
										<%-- 주문금액(정렬대상) --%>
										<td style="text-align: center; padding: 60px 0px 0px 0px;">
											<h6>${order.orders_price}원</h6>
										</td>
										<%-- 상태 --%>
										<td
											style="text-align: center; padding-left: 0px; padding-right: 0px;">


										
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 페이징 -->
			<div class="container">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageMaker.pre}">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link"
								href="${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
						<li
							class="page-item ${pageMaker.cri.pageNum == idx ? 'active' : '' }"><a
							class="page-link" href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item disabled"><a class="page-link"
								href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

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

			<script type="text/javascript">
				var myTable = document.getElementById("product");
				var replace = replacement(myTable);
				function sortTD(index) {
					replace.ascending(index);
				}
				function reverseTD(index) {
					replace.descending(index);
				}
			</script>
		</div>
</body>
</html>
