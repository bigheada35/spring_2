package edu.kosmo.kbat.joinvo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.MemberVO;
import edu.kosmo.kbat.vo.OrderDetailVO;
import edu.kosmo.kbat.vo.OrderVO;
import edu.kosmo.kbat.vo.ProductVO;
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
public class ProductOrderDetailBoardVO {

	private int review_id;
	private int order_detail_id;
	private String board_title;
	private String board_content;
	private Timestamp board_date;
	private int board_hit;
	private int boardtype_id;
	private int member_number;
	private String member_id;
	private int board_id;
	private String member_name;
	private int rating_id;
	private String rating_check;
	
	private int attachment_id;
	private String attachment_name;
		
	private List<BoardtypeVO> boardtypeList;
	
	
	private int orders_id; // 주문번호 fk
	private int orders_price; // 상품주문가격
	private Date orders_date; // 상품주문일자
	
	
	private int product_id;
	private String product_name; // 상품명

	private int video_id;
	private String video_name;
	private int image_id;
	private String image_name;
	
	private MemberVO memberVO; // 회원 VO
	private ProductVO productVO;
	private OrderVO orderVO;
	private OrderDetailVO orderDetailVO;
	private BoardtypeVO boardtypeVO;
}