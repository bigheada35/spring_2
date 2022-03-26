package edu.kosmo.kbat.joinvo;

import java.sql.Date;
import java.util.List;

import edu.kosmo.kbat.vo.OrderDetailVO;
import edu.kosmo.kbat.vo.RBoardAndMemberVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
ORDER_NUMBER	NUMBER
ORDER_PRICE	NUMBER
ORDER_DATE	DATE
MBR_ID	VARCHAR2(50 BYTE)
*/

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProductOrderVO { // 상품주문
	private String orders_id; // 상품주문번호 pk
	private int orders_price; // 상품주문가격
	private Date orders_date; // 상품주문일자
	
	private String member_id; // 회원id fk

	private int video_id;
	private String video_name;
	private int image_id;
	private String image_name;
	
	public OrderDetailVO orderDetailVO;
	public List<OrderDetailVO> listOrderDetailVO;
	private RBoardAndMemberVO rboardVO;
}
