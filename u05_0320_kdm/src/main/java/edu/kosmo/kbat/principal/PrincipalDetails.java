package edu.kosmo.kbat.principal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import edu.kosmo.kbat.vo.AuthVO;
import edu.kosmo.kbat.vo.UserVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrincipalDetails implements UserDetails, OAuth2User {

	private UserVO user;
	private Map<String, Object> attributes;

	// 일반 로그인
	public PrincipalDetails(UserVO user) {
		this.user = user;
	}

	// OAuth 로그인
	public PrincipalDetails(UserVO user, Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<>();

		for (AuthVO auth : user.getAuthList()) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuthority_name()));
		}
		return authorities;

	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getMember_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		System.out.println("boolean isEnabled() " + "값은 PrincipalDetails?");
		if (user.getEnabled() == 0)
			return false;
		else
			return true;
	}

	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return attributes;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getUserID() {
		// TODO Auto-generated method stub
		return user.getMember_id();
	}

}
