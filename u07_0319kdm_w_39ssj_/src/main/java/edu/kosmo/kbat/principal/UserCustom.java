package edu.kosmo.kbat.principal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import edu.kosmo.kbat.vo.AuthVO;
import edu.kosmo.kbat.vo.UserVO;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
public class UserCustom extends User {

	@Setter(onMethod_ = @Autowired)
	private UserVO user;

	public UserCustom(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public UserCustom(UserVO user) {

		// super(user.getUsername(), user.getPassword(), getAuth(user));
		super(user.getMember_id(), user.getPassword(), getAuth(user));

		System.out.println("==========UserCustom");
		this.user = user;
	}

	public static Collection<? extends GrantedAuthority> getAuth(UserVO memberVO) {

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (AuthVO auth : memberVO.getAuthList()) {
			// authorities.add(new SimpleGrantedAuthority(auth.getAuthority()));
			authorities.add(new SimpleGrantedAuthority(auth.getAuthority_name()));
		}

		return authorities;
	}

	// 회원 탈퇴 처리
	@Override
	public boolean isEnabled() {
		System.out.println("boolean isEnabled() " + "값을 가져 가나?");
		if (user.getEnabled() == 0)
			return false;
		else
			return true;
	}
}
