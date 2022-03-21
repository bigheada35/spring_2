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
public class MemberVO {

	private int member_number;
	private String member_id;
	private String password;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_address;
	private String member_company;
		
	private List<NBoardAndMemberVO> boardList;
	
}
