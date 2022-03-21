package edu.kosmo.kbat.principal;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.mapper.UserMapper;
import edu.kosmo.kbat.vo.UserVO;
import lombok.Setter;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

	@Autowired
	private @Lazy BCryptPasswordEncoder bCryptPasswordEncoder;

	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("getClientRegistration : " + userRequest.getClientRegistration());
		System.out.println("getAccessToken : " + userRequest.getAccessToken().getTokenValue());

		OAuth2User oAuth2User = super.loadUser(userRequest);

		System.out.println("getAttributes : " + oAuth2User.getAttributes());

		OAuth2UserInfo oAuth2UserInfo = null;

		if (userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
			// 네이버 소셜 로그인
		} else if (userRequest.getClientRegistration().getClientName().equals("naver")) {
			oAuth2UserInfo = new NaverUserInfo((Map) oAuth2User.getAttributes().get("response"));
			// 카카오 소셜 로그인
		} else if (userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			oAuth2UserInfo = new KakaoUserInfo((Map) oAuth2User.getAttributes());
		} else {
			System.out.println("구글,네이버,카카오 로그인 지원");
		}

		UserVO user = null;

		String authority_name = "ROLE_USER";
		// String provider = userRequest.getClientRegistration().getClientId(); //google
		String provider = userRequest.getClientRegistration().getRegistrationId();
		System.out.println("provider : " + provider);
		// String provider = oAuth2UserInfo.getProvider();
		String providerId = oAuth2UserInfo.getProviderId();
		String member_id = oAuth2UserInfo.getEmail();
		// String member_id = oAuth2User.getAttribute("email");
		System.out.println("email : " + member_id);
		String password = bCryptPasswordEncoder.encode("1");
		String member_email = oAuth2UserInfo.getEmail();
		String member_name = oAuth2UserInfo.getName();

		user = userMapper.getUser(member_id);
		if (user == null) {
			user = UserVO.builder().password(password).member_email(member_email).authority_name(authority_name)
					.provider(provider).providerId(providerId).member_id(member_id).member_name(member_name)
					.member_address("입력해주세요").member_phone("입력해주세요").member_company("입력해주세요").build();
			userMapper.insertUser(user);
			userMapper.insertAuthorities(user);
			user = userMapper.getUser(member_id);
		} else {
			System.out.println("로그인 했음");
		}

		return new PrincipalDetails(user, oAuth2User.getAttributes());
	}

}
