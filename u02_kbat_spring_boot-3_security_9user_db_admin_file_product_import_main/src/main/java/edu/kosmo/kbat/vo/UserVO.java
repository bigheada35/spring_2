package edu.kosmo.kbat.vo;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserVO {

   //private String username;
   //private String password;
   //private int enabled;
   
	
	private int member_number;	//seq
	private String member_id;	//username
	private String password;	//password
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_address;
	private String member_company;
	
	private List<AuthVO> authList;

}
