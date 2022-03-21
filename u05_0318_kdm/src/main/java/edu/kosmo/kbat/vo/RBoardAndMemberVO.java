package edu.kosmo.kbat.vo;

import java.sql.Timestamp;
import java.util.List;

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
public class RBoardAndMemberVO {

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
	private int rating_check;

	private int attachment_id;
	private String attachment_name;

	private List<BoardtypeVO> boardtypeList;

}
