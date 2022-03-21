<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>아임포트2</title>
   
    <!-- ssj 0128 -->
   	<!-- csrf meta tag -->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
   
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	
	<script type="text/javascript">
   	
    //버튼 클릭하면 실행
    function payment(data) {
    	
    	$(responseStrHtml_1).html("");
        $(responseStrHtml_1).append("<br/>")
        $(responseStrHtml_1).append("<br/>")
    	
        //IMP.init('가맹점 식별코드');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
        IMP.init('imp35667230');// sjsong 개인 가맹점 식별 코드//www.import.kr -> 회원가입 -> 관리자 콘솔 로그인 -> 시스템설정-> 내정보
        IMP.request_pay({// param
            pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
            pay_method: "card", //지불 방법
            merchant_uid: "iamport_test_id32", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
            name: "도서3", //결제창에 노출될 상품명
            amount: 1, //금액
            buyer_email : "testiamport@naver.com", 
            buyer_name : "홍길동3",
            buyer_tel : "01012341234"
        }, function (rsp) { // callback
            if (rsp.success) {
                //alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
                
                $(responseStrHtml_1).append("<b>imp_uid: </b><br/>" + rsp.imp_uid);
                $(responseStrHtml_1).append("<b>merchant_uid:</b><br/>" + rsp.merchant_uid);

/*                 $.ajax({
                	type: 'POST',
                	//url: `${pageContext.request.contextPath}/kakao/getAccesToken`,
                	url: `${pageContext.request.contextPath}/pay/getToken`,
        			statusCode: {
        				404: function() {
        					alert( "404 ,page not found" );
        				}
        			},
        			contentType: "application/json",
                	data:{
                		imp_key:"4645602351310261",// REST API키
                		imp_secret:"a0508214c06f1ece211951b540c05d9ac0108a27981e1f1503ff130c7eecf8b71f22faede5b7519c"// REST API Secret
                	},
                	success: function (response) {
                		$(responseStrHtml_1).append("<b> 컨트롤러에서 응답 OK </b><br/>");
                	}
                }).done(function(data){
                	$(responseStrHtml_1).append("<b> 컨트롤러 전송 oK </b><br/>");	
                }); 
*/
                
            } else {
                
                $(responseStrHtml_1).append("<b>실패 : 코드[ " + rsp.error_code +"] </b><br/>" );
                $(responseStrHtml_1).append("<b>실패 : 메세지[ " + rsp.error_msg +"] </b><br/>" );
                
                //alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
                                
                //////////////////////////////////
                //test to send data to controller
                //////////////////////////////////
                <!-- ssj 0128 -->
				<!-- csrf -->
        		var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				$.ajax({
                	type: 'POST',
                	//url: `${pageContext.request.contextPath}/kakao/getAccesToken`,
                	//url: "${pageContext.request.contextPath}/pay/getAccesToken",
                	//url: `rest/pay/getToken`,
                	url: `/pay/getAccesToken`,
                    beforeSend: function(xhr) {  /* ssj 0128 csrf  */
                        xhr.setRequestHeader(header, token); /* ssj 0128 csrf  */
                     //	xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
                     },                	
        			statusCode: {
        				404: function() {
        					alert( "404 ,page not found" );
        				}
        			},
        			contentType: "application/json",
                	data:{
                		imp_key:"4645602351310261",// REST API키
                		imp_secret:"a0508214c06f1ece211951b540c05d9ac0108a27981e1f1503ff130c7eecf8b71f22faede5b7519c"// REST API Secret
                	},
                	success: function (response) {
                		$(responseStrHtml_1).append("<b> 컨트롤러에서 응답 OK </b><br/>");
                	}
                }).done(function(data){
                	$(responseStrHtml_1).append("<b> 컨트롤러 전송 oK </b><br/>");	
                });          
                
                
                
            }
        });
    }
    
    function getAccessToken(data){
    	console.log("---getAccessToken---");
        	
        $(responseStrHtml_2).html("");
        $(responseStrHtml_2).append("<br/>")
        $(responseStrHtml_2).append("<br/>")
        
        // error : 
        //Access to XMLHttpRequest at 'https://api.iamport.kr/users/getToken' from origin 'http://localhost:8282' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource.
		//jquery-1.12.4.min.js:4   POST https://api.iamport.kr/users/getToken net::ERR_FAILED
		<!-- ssj 0128 -->
		<!-- csrf -->
        var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
        
        $.ajax({
        	type: 'POST',
        	//cache : false,
        	url: 'https://api.iamport.kr/users/getToken',
            //beforeSend: function(xhr) {  /* ssj 0128 csrf  */
            //    xhr.setRequestHeader(header, token); /* ssj 0128 csrf  */
            // //	xhr.setRequestHeader("X-CSRF-Token", "${_csrf.token}");
            // },
        	headers:{"Content-Type":"application/json"},
        	//contentType:"application/json",
        	data:{
        		imp_key:"4645602351310261",// REST API키
        		imp_secret:"a0508214c06f1ece211951b540c05d9ac0108a27981e1f1503ff130c7eecf8b71f22faede5b7519c"// REST API Secret
        	},
        	//dataType:"JSON",
        	//data: JSON.stringify({'imp_key':"4645602351310261",'imp_secret':"a0508214c06f1ece211951b540c05d9ac0108a27981e1f1503ff130c7eecf8b71f22faede5b7519c"}),
        	//success : function(data){
        	//	//통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
        	///	console.log("---success--");
        	//	console.log(data);
        	//	console.log(data.response);
        	//	$(responseStrHtml_2).append("<b>통신이 성공</b><br/>")
        	//},
        	//complete : function(data){
        	//	//통신이 실패했어도 완료가 되었을때 이 함수를 타게 된다.
        	//	console.log("--complete--");
        	//	console.log(data);
        	//	$(responseStrHtml_2).append("<b>통신이 실패했어도 완료</b><br/>")
        	//},
        	error:function(xhr,status,error){
        		console.log(error);
        		$(responseStrHtml_2).append("<b>에러:</b><br/>")
        	}
        	
        }).done(function(){
        	//alert("요청성공~!");
        	console.log("---요청성공~!---");
        	$(responseStrHtml_2).append("<b>요청성공~!</b><br/>")
        })

    }
	
    
    function getAccessToken_a(data){
    	console.log("---getAccessToken_a---");
        	
        $(responseStrHtml_2a).html("");
        $(responseStrHtml_2a).append("<br/>")
        $(responseStrHtml_2a).append("<br/>")
        
        
		$.ajax({
			type : "post",
			url : "https://api.iamport.kr/users/getToken",
			//dataType : "json",
			success : function(data) {
				// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				//console.log(data);
				var result = JSON.parse(data);
			},
			error : function(xhr, status, error) {
				console.log(error);
			},
            data: {
                imp_key: "4645602351310261", // [아임포트 관리자] REST API키
                imp_secret: "a0508214c06f1ece211951b540c05d9ac0108a27981e1f1503ff130c7eecf8b71f22faede5b7519c" // [아임포트 관리자] REST API Secret
            }
		});
        
   
    }
    
    
    
    function ajaxTest(data){
    	console.log("---ajaxTest---");
        	
        $(responseStrHtml_3).html("");
        $(responseStrHtml_3).append("<br/>")
        $(responseStrHtml_3).append("<br/>")
        

        var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
        
		
		$.ajax({
        	type: 'POST',
        	url: "${pageContext.request.contextPath}/pay/getAccesToken",
			contentType: "application/json",
        	data:{
        		imp_key:"4645602351310261",// REST API키
        		imp_secret:"a0508214c06f1ece211951b540c05d9ac0108a27981e1f1503ff130c7eecf8b71f22faede5b7519c"// REST API Secret
        	},
        	success: function (response) {
        		$(responseStrHtml_3).append("<b> 컨트롤러에서 응답 OK </b><br/>");
        	},        	
        	error:function(xhr,status,error){
        		console.log(error);
        		$(responseStrHtml_2).append("<b>에러:</b><br/>")
        	}
        }).done(function(data){
        	$(responseStrHtml_3).append("<b> 컨트롤러에 전송 완료 </b><br/>");	
        });  
		
    }
    
    
    function ajaxTest2(data){
    	console.log("---ajaxTest2---");
        	
        $(responseStrHtml_4).html("");
        $(responseStrHtml_4).append("<br/>")
        $(responseStrHtml_4).append("<br/>")
        

        var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
        
		//주의할점 : controller에서  csrf disable 상태인데, csrf를 넣어서 보내면
			//controller안의 RestController에 전달이 제대로 않된다.
		$.ajax({
        	type: 'POST',
        	url: "${pageContext.request.contextPath}/pay/getAccesToken",
            //beforeSend: function(xhr) {  
            //    xhr.setRequestHeader(header, token);
            //},
			//dataType: 'json',
        	success: function (response) {
        		$(responseStrHtml_4).append("<b> 컨트롤러에서 응답 OK </b><br/>");
        	}
			//statusCode: {
			//	404: function() {
			//		alert( "404 ,page not found" );
			//	}
			//}
        }).done(function(data){
        	$(responseStrHtml_4).append("<b> 컨트롤러에 전송 완료 </b><br/>");	
        });  
		
    }
    
    
	//문서가 준비되면 제일먼저 실행
	$(document).ready(function(){
		$("#iamportPayment").click(function(){
			payment();//버튼 클릭하면 호출
		});

		$("#getAccessToken").click(function(){
			getAccessToken();//버튼 클릭하면 호출
		});
		$("#getAccessToken_a").click(function(){
			getAccessToken_a();//버튼 클릭하면 호출
		});	
		$("#ajaxTest").click(function(){
			ajaxTest();//버튼 클릭하면 호출
		});
		
		$("#ajaxTest2").click(function(){
			ajaxTest2();//버튼 클릭하면 호출
		});
		
	});
	
	//alert("---3---");
   	</script>
   
   
</head>

<body>

<h1>아임포트</h1>


		<div>
			<h2>iamport 결제데모</h2>
			<li>
				<button id="iamportPayment" type="button">결제테스트</button>
			</li>

			<div id="responseStrHtml_1">
			</div>
	
			
			<li>
				<button id="getAccessToken" type="button">억세스토큰 받기</button>
			</li>
			<div id="responseStrHtml_2">

			</div>

			<li>
				<button id="getAccessToken_a" type="button">억세스토큰 받기a</button>
			</li>
			<div id="responseStrHtml_2a">

			</div>


			<li>
				<button id="ajaxTest" type="button">ajax 테스트( jsp -> controller )</button>
			</li>
			<div id="responseStrHtml_3">

			</div>

			<li>
				<button id="ajaxTest2" type="button">ajaxTest2 테스트( jsp -> controller )</button>
			</li>
			<div id="responseStrHtml_4">

			</div>
			
		</div>



</body>
</html>