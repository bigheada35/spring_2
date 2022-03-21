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
public class QBoardAndMemberVO {

	private String board_title;
	private String board_content;
	private Timestamp board_date;
	private int board_hit;
	private int boardtype_id;
	private int member_number;
	private String member_id;
	private int reply_id;
	private int reply_group;
	private int reply_step;
	private int reply_indent;
	private int board_id;
	private String member_name;
	private String board_enable; // 공개비공개
	
	private int attachment_id;
	private String attachment_name;

	private List<BoardtypeVO> boardtypeList;

	private List<QBoardAndMemberVO> qgetListWithPaging;

}
