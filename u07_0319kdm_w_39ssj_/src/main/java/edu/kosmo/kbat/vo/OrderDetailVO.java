package edu.kosmo.kbat.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderDetailVO {

	private int order_detail_id; // 주문상세번호
	private int order_detail_count; // 수량

	private int orders_id; // 주문 번호FK
	private int product_id; // 상품 번호FK

}
