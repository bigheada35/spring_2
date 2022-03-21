package edu.kosmo.kbat.vo;

import java.sql.Date;
import java.util.List;

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
public class OrderVO {

	private int orders_id; // 주문 번호PK
	private String orders_price; // 총 가격
	private Date orders_date; // 주문 날짜
	private int member_number; // 회원 번호FK
	private String member_id;

	public OrderDetailVO orderDetailVO; // 주문상세
	public List<OrderDetailVO> listOrderDetailVO;
	private RBoardAndMemberVO rboardVO; // 리뷰게시판

}
