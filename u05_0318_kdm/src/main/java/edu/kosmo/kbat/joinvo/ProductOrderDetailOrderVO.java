package edu.kosmo.kbat.joinvo;

import java.sql.Date;
import java.sql.Timestamp;

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

public class ProductOrderDetailOrderVO { // 상품, 상품카테고리, 주문, 주문상세, 회원 조인 = 주문 조회 VO
	private int product_id; // 상품id
	private String product_name; // 상품명
	private int product_price; // 상품가격
	private int product_enable; // 비공개여부 = default 1
	private Timestamp product_date;
	private int product_stock; // 상품재고량
	private String product_description;

	private int category_id; // 상품카테고리번호
	private String category_name; // 상품카테고리명

	private String orders_id; // 주문번호 fk
	private int orders_price; // 총 가격
	private Date orders_date; // 상품주문일자

	private int member_number; // 회원번호 fk
	private String member_id; // 회원 ID

	private int order_detail_id; // 주문상세번호
	private int order_detail_count; // 수량

}