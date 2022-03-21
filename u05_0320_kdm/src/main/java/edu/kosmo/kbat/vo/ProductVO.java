package edu.kosmo.kbat.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Slf4j
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProductVO {

	private int category_id;
	private String category_name;
	private int category_parent;
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_enable;
	private Timestamp product_date;
	private int product_stock;
	private String product_description;
	private int video_id;
	private String video_name;
	private int image_id;
	private String image_name;

	private int member_number; // 멤버 테이블
	private String member_id;

}
