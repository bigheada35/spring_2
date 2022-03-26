<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
      
      #cart-and-order {
            width:340px; height:300px;
           /* background-color:yellow;  */
           position:fixed;
           top:25%; left:70%;
           opacity:1.0;
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
            <li><a href="#" class="text-white">Follow on Twitter</a></li>
            <li><a href="#" class="text-white">Like on Facebook</a></li>
            <li><a href="#" class="text-white">Email me</a></li>
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

<main role="main" >

   <section class="jumbotron text-left">
    <div class="container">
      <h1>${prod.video_name}</h1>
      <p class="lead text-muted">${prod.product_description}</p>
      <p>
      		<!-- controls loop muted style="width:100%"-->	
	      	<video width="600" height="500" autoplay controls/>
	         	<source src="<c:url value="${prod.video_name}"/>" type="video/mp4">
		    </video>
      </p>
    </div>
  </section> 
  

  <div id="cart-and-order">
  		        <div class="col-md-12">
		          <div class="card mb-4 shadow-sm">
		            <img class="bd-placeholder-img card-img-top" src="<c:url value="${prod.image_name}"/>" width="100%" height="160" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">${status.index+1} ${prod.product_name}</text></svg>
		            <div class="card-body">
		              <p class="card-text">${prod.product_description}</p>
		              <p class="card-text">가격 : ${prod.product_price} 원</p>
		              <p class="card-text">${prod.product_date}</p>
		              <div class="d-flex justify-content-between align-items-center">
		              	<a href="/main/cartorder?product_id=${prod.product_id}" class="btn btn-primary my-2">장바구니담기</a>&nbsp
		              	<a href="/main/checkout?product_id=${prod.product_id}" class="btn btn-primary my-2">구매하기</a>&nbsp
		              	<a href="/main/playVideo?product_id=${prod.product_id}" class="btn btn-primary my-2">Play</a>
		              </div>
		            </div>
		          </div>
		        </div>
  </div>


    <div class="container">
    
		
		        <div class="col-md-8">
		        
			      <table class="table table-warning">
			        <thead>
			          <tr>
			            <th scope="col">글번호</th>
			            <th scope="col">제목</th>
			            <th scope="col">작성자</th>
			            <th scope="col">조회수</th>
			          </tr>
			        </thead>
			        <tbody>
			          <tr>
			            <th scope="row">1</th>
			            <td>그때 가 생각나는고 너무 너무 좋아요</td>
			            <td>퇘개미</td>
			            <td>233</td>
			          </tr>
			          <tr>
			            <th scope="row">2</th>
			            <td>감사합니다 좋은 곡이에요</td>
			            <td>익명</td>
			            <td>123</td>
			          </tr>
			          <tr>
			            <th scope="row">3</th>
			            <td colspan="2">30년전 목소리 너무 좋아요</td>
			            <td>566</td>
			          </tr>
			        </tbody>
			      </table>
		          
		          <table class="table table-info">
			        <thead>
			          <tr>
			            <th scope="col">글번호</th>
			            <th scope="col">제목</th>
			            <th scope="col">작성자</th>
			            <th scope="col">조회수</th>
			          </tr>
			        </thead>
			        <tbody>
			          <tr>
			            <th scope="row">1</th>
			            <td>쿠폰 발행 언제 되나요?</td>
			            <td>퇴근합니다</td>
			            <td>78</td>
			          </tr>
			          <tr>
			            <th scope="row">2</th>
			            <td>아 저 시간있으세요?</td>
			            <td>오로라고래</td>
			            <td>56</td>
			          </tr>
			          <tr>
			            <th scope="row">3</th>
			            <td colspan="2">도코에서 만난 전여친도 이노래 좋아해요?</td>
			            <td>9992</td>
			          </tr>
			        </tbody>
			      </table>
		          
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
