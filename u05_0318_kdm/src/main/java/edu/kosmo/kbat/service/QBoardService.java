package edu.kosmo.kbat.service;

import java.util.List;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.QBoardAndMemberVO;

public interface QBoardService {

	// List<QBoardAndMemberVO> qgetList();
	QBoardAndMemberVO qread(int board_id);

	void qwrite(QBoardAndMemberVO board);

	void qmodify(QBoardAndMemberVO board);

	void qhit(int board_id);

	// 답글
	void qdelete(int board_id);

	// void qregisterBoard(QBoardAndMemberVO board);
	void qregisterReply(QBoardAndMemberVO board);

	// void qregisterReply(int group, int step);
	void qrepwrite(QBoardAndMemberVO board);

	// 페이징
	int qgetTotalCount();

	public List<QBoardAndMemberVO> qgetList(Criteria criteria);

	List<BoardtypeVO> qgetboardtypeList();

}
