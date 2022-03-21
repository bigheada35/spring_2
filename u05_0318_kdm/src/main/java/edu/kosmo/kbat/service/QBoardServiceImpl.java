package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.mapper.QBoardAndMemberMapper;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.QBoardAndMemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QBoardServiceImpl implements QBoardService {

	@Autowired
	private QBoardAndMemberMapper boardAndMemberMapper;// ssj
	/*
	 * @Override public List<QBoardAndMemberVO> qgetList() {//ssj2
	 * log.info("getList().."); return boardAndMemberMapper.qgetList(); }
	 */

	@Override
	public QBoardAndMemberVO qread(int board_id) {
		log.info("read()..");
		qhit(board_id);
		return boardAndMemberMapper.qread(board_id);
	}

	@Override
	public void qwrite(QBoardAndMemberVO board) {
		log.info("write()..");
		boardAndMemberMapper.qwrite(board);
		System.out.println("member=======" + board.getMember_number());
		log.info("write()1..");
		// boardAndMemberMapper.qrepwrite(board);
		log.info("write2()..");
		boardAndMemberMapper.qwriteimg(board);
	}

	@Override
	public void qrepwrite(QBoardAndMemberVO board) {
		log.info("rewrite()..");
		boardAndMemberMapper.qrepwrite(board);
		System.out.println("reply1 : " + board.getReply_id());
		System.out.println("reply1 : " + board.getReply_group());
		System.out.println("reply2 : " + board.getReply_step());
		System.out.println("reply2 : " + board.getReply_indent());
		log.info("rewrite2()..");
	}

	@Override
	public void qmodify(QBoardAndMemberVO board) {
		log.info("modify()service...");
		boardAndMemberMapper.qmodify(board);
		log.info("modify()service2...");
	}

	@Override
	public void qhit(int board_id) {
		log.info("hit()...");
		boardAndMemberMapper.qhit(board_id);
	}

	@Override
	public void qdelete(int board_id) {
		log.info("delete()...");
		boardAndMemberMapper.qdelete(board_id);
	}

	@Override
	public List<QBoardAndMemberVO> qgetList(Criteria criteria) {
		log.info("getList() ..");
		// return boardMapper.getListWithPaging(criteria);
		// return boardAndMemberMapper.qgetListWithPaging(criteria);//ssj3
		List<QBoardAndMemberVO> lst = boardAndMemberMapper.qgetListWithPaging(criteria);
		return lst;
	}

	@Override
	public List<BoardtypeVO> qgetboardtypeList() {
		return boardAndMemberMapper.qgetboardtypeList();// ssj
	}

	@Override
	public void qregisterReply(QBoardAndMemberVO board) {
		boardAndMemberMapper.qupdateShape(board.getReply_group(), board.getReply_step());
		boardAndMemberMapper.qregisterBoard(board);
		boardAndMemberMapper.qregisterReply(board);
	}

	@Override
	public int qgetTotalCount() {
		log.info("getTotal() ..");
		return boardAndMemberMapper.qgetTotalCount();
	}

}
