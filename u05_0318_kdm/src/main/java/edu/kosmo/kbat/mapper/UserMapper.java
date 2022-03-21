package edu.kosmo.kbat.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.vo.UserVO;

@Mapper
public interface UserMapper {

	public UserVO getUser(String username);

	@Insert("insert into member(member_number, member_id, password, member_name, member_phone, member_email, member_address, member_company) "
			+ "values(member_seq.nextval, #{member_id}, #{password}, #{member_name}, #{member_phone}, #{member_email}, #{member_address}, #{member_company})")
	public int insertUser(UserVO userVO);

	@Insert("insert into authority(authority_id, authority_name, member_number) values(authority_seq.nextval, 'ROLE_USER', member_seq.currval)")
	public void insertAuthorities(UserVO UserVO);

	@Insert("insert into authority(authority_id, authority_name, member_number) values(authority_seq.nextval, 'ROLE_ADMIN', member_seq.currval)")
	public void insertAuthoritiesAdmin(UserVO UserVO);

}
