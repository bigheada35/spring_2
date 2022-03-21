package edu.kosmo.kbat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.RBoardAndMemberVO;

@Mapper
public interface RBoardAndMemberMapper {

	List<RBoardAndMemberVO> rgetList();

	RBoardAndMemberVO rread(int board_id);

	void rwrite(RBoardAndMemberVO board);

	void rmodify(RBoardAndMemberVO board);

	void rhit(int board_id);

	void rdelete(int board_id);

	// 페이징
	int rgetTotalCount();

	List<RBoardAndMemberVO> rgetListWithPaging(Criteria criteria);

	List<BoardtypeVO> rgetboardtypeList();

	// 후기
	void rwrite_review(RBoardAndMemberVO board);

	void rwrite_rating(RBoardAndMemberVO board);

	// 사진첨부
	@Insert("insert into attachment(attachment_id, attachment_name, board_id)"
			+ "values(attachment_seq.nextval, #{attachment_name}, #{board_id}")
	void rwrite_img(String attachment_name);

}
