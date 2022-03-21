package edu.kosmo.kbat.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

//@Slf4j
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProductCartVO {
	
	private int member_number;
	private String member_id;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_address;
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
	
}
