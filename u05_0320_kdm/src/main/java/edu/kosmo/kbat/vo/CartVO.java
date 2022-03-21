package edu.kosmo.kbat.vo;

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
public class CartVO {

	private int cart_id; // 장바구니번호
	private int cart_count; // 장바구니 수량 기본 1로;

	private int member_number; // 회원번호FK
	private int product_id; // 상품 번호 FK

	private int member_id; // 회원아이디FK

}
