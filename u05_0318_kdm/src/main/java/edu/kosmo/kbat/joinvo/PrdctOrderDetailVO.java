package edu.kosmo.kbat.joinvo;

import java.sql.Date;

import edu.kosmo.kbat.vo.OrderDetailVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PrdctOrderDetailVO { // 결제 후 정보 저장
	private String order_number; // 상품주문번호
	private int order_price; // 상품주문가격
	private Date order_date; // 상품주문일자

	private String member_number; // 회원id fk
	private String member_id; // 회원id fk

	private String product_id; // 상품id fk

	private int order_amount; // 주문상품량
	private int product_price; // 상품금액
	private String product_name; // 상품이름 추가

	private OrderDetailVO[] orderDetailVO;

}
