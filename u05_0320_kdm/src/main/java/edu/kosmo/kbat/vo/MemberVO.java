package edu.kosmo.kbat.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
	private int enabled; // 시큐리티

	private List<NBoardAndMemberVO> boardList;

	// 4개 추가
	// private String username;
	// private String role;
	private String provider;
	private String providerId;
	private String authority_name;

	private List<AuthVO> authList;

	// 추가
	@Builder
	public MemberVO(String member_id, String member_name, String password, String member_phone, String member_email,
			String member_address, String member_company, String provider, String providerId, String authority_name,
			int enabled) {
		this.member_id = member_id;
		this.password = password;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_address = member_address;
		this.member_company = member_company;
		this.provider = provider;
		this.providerId = providerId;
		this.authority_name = authority_name;
		this.member_name = member_name;
		this.enabled = enabled;
	}
}
