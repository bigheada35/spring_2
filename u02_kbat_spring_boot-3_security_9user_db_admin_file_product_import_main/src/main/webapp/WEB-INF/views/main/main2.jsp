<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/WEB-INF/include/header.jspf"%>
    <title>공부어때 동영상 강의 쇼핑몰</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/navbars/">
    <!-- Bootstrap core CSS -->
	<link href="/css/assets/dist/css/bootstrap.min.css" rel="stylesheet">
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
<!--     <link href="/css/album.css" rel="stylesheet"> -->
    <link href="/css/navbar.css" rel="stylesheet">
  </head>
  <body>
  
    <header>
    
	<div class="row flex-nowrap justify-content-between align-items-center">
	  <div class="col-4 pt-1">
	    <a class="text-muted" href="#">Subscribe</a>
	  </div>
	  <div class="col-4 text-center">
	    <a class="blog-header-logo text-dark" href="#">Large</a>
	  </div>
	  <div class="col-4 d-flex justify-content-end align-items-center">
	    <a class="text-muted" href="#" aria-label="Search">
	      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
	    </a>
	    <a class="btn btn-sm btn-outline-secondary" href="#">Sign up</a>
	  </div>
	</div>
	<div class="nav-scroller py-1 mb-2">
	  <nav class="nav d-flex justify-content-between">
	    <a class="p-2 text-muted" href="#">World</a>
	    <a class="p-2 text-muted" href="#">U.S.</a>
	    <a class="p-2 text-muted" href="#">Technology</a>
	    <a class="p-2 text-muted" href="#">Design</a>
	    <a class="p-2 text-muted" href="#">Culture</a>
	    <a class="p-2 text-muted" href="#">Business</a>
	    <a class="p-2 text-muted" href="#">Politics</a>
	    <a class="p-2 text-muted" href="#">Opinion</a>
	    <a class="p-2 text-muted" href="#">Science</a>
	    <a class="p-2 text-muted" href="#">Health</a>
	    <a class="p-2 text-muted" href="#">Style</a>
	    <a class="p-2 text-muted" href="#">Travel</a>
	  </nav>
	</div>
  
	</header>

<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1>공부어때 동영상 강의 쇼핑몰</h1>
      <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
      <p>
        <a href="#" class="btn btn-primary my-2">Main call to action</a>
        <a href="#" class="btn btn-secondary my-2">Secondary action</a>
      </p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
    
		
<%-- 	      <div class="row">
	    	<c:forEach items="${products}" var="prod" varStatus="status" >  	
		        <div class="col-md-3">
		          <div class="card mb-3 shadow-sm">
					<!--<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
		            <img class="bd-placeholder-img card-img-top" src="<c:url value="${prod.image_name}"/>" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">${status.index+1} ${prod.product_name}</text></svg>
		            <img class="card-img-top" src="<c:url value="${prod.image_name}"/>" style="min-height:250px;"/>
		            <div class="card-body">
		              <p class="card-text">${prod.product_description}</p>
		              <p class="card-text">가격 : ${prod.product_price} 원</p>
		              <p class="card-text">${prod.product_date}</p>
		              <div class="d-flex justify-content-between align-items-center">
		              	<a href="/main/detail?product_id=${prod.product_id}" class="btn btn-primary my-2">View</a>
		                <small class="text-muted">9 mins</small>
		              </div>
		            </div>
		          </div>
		        </div>
		  
			</c:forEach>		   
		   </div> --%>


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
