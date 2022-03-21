<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<title>마이페이지</title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td>주문번호:</td>
			<td>상품번호:</td>
			<td>회원 아이디:</td>
			<td>상품 명:</td>
			<td>주문 날짜:</td>
			<td>주문 가격:</td>


		</tr>


		<!-- 여기 또 핵심 3 -->
		<c:forEach var="order_list" items="${order_list}">
			<tr>
				<td>${order_list.orders_id}</td>
				<td>${order_list.product_id}</td>
				<td>${order_list.member_id}</td>
				<td>${order_list.product_name}</td>
				<td>${order_list.orders_date}</td>
				<td>${order_list.orders_price}</td>

			</tr>
		</c:forEach>


	</table>
	<!-- 페이징 -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${pageMaker.prev}">
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

</body>
</html>
