<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>아임포트2</title>
   
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	

	
	<script type="text/javascript">
   	
    //버튼 클릭하면 실행
    function payment(data) {
        //IMP.init('가맹점 식별코드');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
        IMP.init('imp35667230');// sjsong 개인 가맹점 식별 코드//www.import.kr -> 회원가입 -> 관리자 콘솔 로그인 -> 시스템설정-> 내정보
        IMP.request_pay({// param
            pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
            pay_method: "card", //지불 방법
            merchant_uid: "iamport_test_id4", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
            name: "도서2", //결제창에 노출될 상품명
            amount: 10, //금액
            buyer_email : "testiamport@naver.com", 
            buyer_name : "홍길동",
            buyer_tel : "01012341234"
        }, function (rsp) { // callback
            if (rsp.success) {
                alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
            } else {
                alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
            }
        });
    }
	
	//문서가 준비되면 제일먼저 실행
	$(document).ready(function(){
		$("#iamportPayment").click(function(){
			payment();//버튼 클릭하면 호출
		});
	});
		
		alert("---3---");
   	</script>
   
   
</head>

<body>

<h1>아임포트</h1>


		<div>
			<h2>iamport 결제데모</h2>
			<li>
				<button id="iamportPayment" type="button">결제테스트</button>
			</li>
		</div>


</body>
</html>