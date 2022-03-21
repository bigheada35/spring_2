package edu.kosmo.kbat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.NBoardAndMemberVO;

@Mapper
public interface NBoardAndMemberMapper {

	// List<NBoardVO> getList();
	List<NBoardAndMemberVO> getList();// ssj2

	NBoardAndMemberVO read(int board_id); // esh ///ㅁㅁㅁㅁ

	void write(NBoardAndMemberVO board); // ㅁㅁㅁㅁ
	// void write(NBoardVO board); esh //ㅁㅁㅁㅁ
	// void modify(NBoardAndMemberVO board); //ㅁㅁㅁㅁ

	void hit(int board_id);

	void delete(int board_id);

	// 페이징
	int getTotalCount();

	List<NBoardAndMemberVO> getListWithPaging(Criteria criteria);

	List<BoardtypeVO> getboardtypeList();

	void modify(NBoardAndMemberVO board);

}
