package edu.kosmo.kbat.service;

import java.util.List;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.RBoardAndMemberVO;

public interface RBoardService {

	List<RBoardAndMemberVO> rgetList();

	RBoardAndMemberVO rread(int board_id);

	void rwrite(RBoardAndMemberVO board);

	void rmodify(RBoardAndMemberVO board);

	void rhit(int board_id);

	void rdelete(int board_id);

	// 페이징
	int rgetTotalCount();

	public List<RBoardAndMemberVO> rgetList(Criteria criteria);

	// void rwrite_review(RBoardAndMemberVO board);
	// void rwrite_rating(RBoardAndMemberVO board);
	// void rwrite_img(RBoardAndMemberVO board);

	List<BoardtypeVO> qgetboardtypeList();

}
