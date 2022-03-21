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
public class AuthVO {
	//private String username;
	//private String authority;	
	
	private int authority_id; //seq
	private String authority_name;//authority
	private String member_number;
}
