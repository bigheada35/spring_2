package edu.kosmo.kbat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.QBoardAndMemberVO;

@Mapper
public interface QBoardAndMemberMapper {

	// List<QBoardAndMemberVO> qgetList();
	QBoardAndMemberVO qread(int board_id);

	void qwrite(QBoardAndMemberVO board);

	void qmodify(QBoardAndMemberVO board);

	void qhit(int board_id);

	void qdelete(int board_id);

	// 답글
	// void qupdateShape(QBoardAndMemberVO board);

	// void qinsertReply(QBoardAndMemberVO board);
	void qregisterBoard(QBoardAndMemberVO board);

	void qregisterReply(QBoardAndMemberVO board);

	// 댓글글쓰기
	void qrepwrite(QBoardAndMemberVO board);

	// 사진첨부
	@Insert("insert into attachment(attachment_id, attachment_name, board_id)"
			+ "values(attachment_seq.nextval, #{attachment_name}, #{board_id}")
	void qwriteimg(QBoardAndMemberVO board);

	// 페이징
	int qgetTotalCount();

	List<QBoardAndMemberVO> qgetListWithPaging(Criteria criteria);

	List<BoardtypeVO> qgetboardtypeList();

	void qupdateShape(int reply_group, int reply_step);

}
