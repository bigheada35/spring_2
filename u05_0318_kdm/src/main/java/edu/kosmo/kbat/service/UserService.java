package edu.kosmo.kbat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.mapper.UserMapper;
import edu.kosmo.kbat.vo.UserVO;
import lombok.NoArgsConstructor;

//@Slf4j
@NoArgsConstructor
@Service
public class UserService {

	// 에러나서 -->
	// @Autowired
	// private BCryptPasswordEncoder passEncoder;
	// --> 이렇게 시도해봄,OK.
	BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();

	@Autowired
	private UserMapper userMapper;

	public UserVO getUser(String member_id) {
		return userMapper.getUser(member_id);
	}

	// caution: must use @Transactional
	// @Transactional(rollbackFor = Exception.class)
	public void addUser(UserVO userVO) {

		// System.out.println("==========addUser:"+userVO.getUsername()
		// +","+userVO.getPassword());
		System.out.println("==========addUser:" + userVO.getMember_id() + "," + userVO.getPassword());

		String password = userVO.getPassword();
		String encode = passEncoder.encode(password);

		userVO.setPassword(encode);

		userMapper.insertUser(userVO);
		userMapper.insertAuthorities(userVO);
	}

	public void addAdmin(UserVO userVO) {

		// System.out.println("==========addUser:"+userVO.getUsername()
		// +","+userVO.getPassword());
		System.out.println("==========addUser:" + userVO.getMember_id() + "," + userVO.getPassword());

		String password = userVO.getPassword();
		String encode = passEncoder.encode(password);

		userVO.setPassword(encode);

		userMapper.insertUser(userVO);
		userMapper.insertAuthoritiesAdmin(userVO);
	}

}
