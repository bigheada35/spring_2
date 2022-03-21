package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.kosmo.kbat.mapper.QBoardAndMemberMapper;
import edu.kosmo.kbat.mapper.RBoardAndMemberMapper;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.MemberVO;
import edu.kosmo.kbat.vo.QBoardAndMemberVO;
import edu.kosmo.kbat.vo.RBoardAndMemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RBoardServiceImpl implements RBoardService{
		
	@Autowired
	private RBoardAndMemberMapper boardAndMemberMapper;//ssj

	
	@Override
	public List<RBoardAndMemberVO> rgetList() {
		log.info("getList()..");
		return boardAndMemberMapper.rgetList();
	}

	@Override
	public RBoardAndMemberVO rread(int board_id) {
		log.info("read()..");
		rhit(board_id);
		return boardAndMemberMapper.rread(board_id);
	}

	@Override
	public void rwrite(RBoardAndMemberVO board) {
		log.info("write()..");
		
		String attachment_name = board.getAttachment_name();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@" + attachment_name);
		
		boardAndMemberMapper.rwrite(board);
		boardAndMemberMapper.rwrite_review(board);
		boardAndMemberMapper.rwrite_rating(board);
		
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$" + board.getAttachment_name());
		
		boardAndMemberMapper.rwrite_img(attachment_name);
		
		//boardAndMemberMapper.rwrite_img(board.getAttachment_name());
		
		System.out.println("=====================" + attachment_name);
	}

	@Override
	public void rmodify(RBoardAndMemberVO board) {
		log.info("modify()service...");	
		boardAndMemberMapper.rmodify(board);	
	}

	@Override
	public void rhit(int board_id) {
		log.info("hit()...");	
		boardAndMemberMapper.rhit(board_id);	
	}

	@Override
	public void rdelete(int board_id) {
		log.info("delete()...");	
		boardAndMemberMapper.rdelete(board_id);	
	}


	@Override
	public int rgetTotalCount() {
		log.info("getTotal() ..");
		return boardAndMemberMapper.rgetTotalCount();
	}

	@Override
	public List<RBoardAndMemberVO> rgetList(Criteria criteria) {
		log.info("getList() ..");
		return boardAndMemberMapper.rgetListWithPaging(criteria);
	}

	@Override
	public List<BoardtypeVO> qgetboardtypeList() {
		return boardAndMemberMapper.rgetboardtypeList();
	}

	
	
	
}
