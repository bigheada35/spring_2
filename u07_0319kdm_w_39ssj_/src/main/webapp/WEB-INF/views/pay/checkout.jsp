<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/WEB-INF/include/header.jspf"%>
    <title>공부어때 동영상 강의 쇼핑몰</title>
    
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="/css/album.css" rel="stylesheet">
  </head>
  <body>
    <header>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white">About</h4>
          <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contact</h4>
          <ul class="list-unstyled">
            <li><a href="/main/cartorder" class="text-white">/main/cartorder</a></li>
            <li><a href="/upload/list2" class="text-white">/upload/list2</a></li>
            <li><a href="/login" class="text-white">/login</a></li>
            <sec:authorize access="isAuthenticated()">
				<li><a href="#" class="text-white">아이디: <sec:authentication property="principal.user.member_id"/></a></li>
				<li><a href="#" class="text-white">이름: <sec:authentication property="principal.user.member_name"/></a></li>
			</sec:authorize>	
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="/main/main" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>공부어때 동영상 강의 쇼핑몰</strong>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
	</header>

<main role="main">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 badge-light">
			<h1>장바구니</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-10 text-center">
			<table width="1000" cellpadding="0" cellspacing="0" border="1">
				<c:forEach items="${products}" var="prod">
				<tr>
							<td><img src="<c:url value="${prod.image_name}"/>" style="max-width:150px;"/></td>
							<td>${prod.product_name} </td>
							<td><fmt:formatNumber value="${prod.product_price}" pattern="#,###" />원 </td>
							<td><a href="/main/checkout_delete?product_id=${prod.product_id}">카트상품삭제</a></td>
				 </tr>
				</c:forEach>	
			</table>
		</div>
	</div>

	
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 badge-light ">
			<h1>주문 내용</h1>
		</div>
	</div>	
	
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-10 text-center">
			<table width="1000" cellpadding="0" cellspacing="0" border="1">
				<c:forEach items="${products_order}" var="prod">
				<tr>
					<td>
						<img src="<c:url value="${prod.image_name}"/>" style="max-width:150px;"/>
					</td> 
					<td>${prod.product_name} </td>
					<td><fmt:formatNumber value="${prod.product_price}" pattern="#,###" />원 </td>
					<td>
						<a href="/main/checkout_delete?orders_id=${prod.orders_id}">주문삭제</a> 
					</td>
				 </tr>
				</c:forEach>	
			</table>
		</div>
	</div>	
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 badge-light">
			<h1>결제 하기</h1>
		</div>
	</div>
	<div class="container">
	  <div class="row">
	    <div class="col text-center">
	      <button class="btn btn-default"><a href="/pay/checkout_import">결제하기</a></button>
	    </div>
	  </div>
	</div>


</main>

<footer class="text-muted">
  <div class="container">
    <p class="float-right">
      <a href="#">Back to top</a>
    </p>
    <p>Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p>New to Bootstrap? <a href="https://getbootstrap.com/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/css/assets/dist/js/bootstrap.bundle.min.js"></script>
</html>
