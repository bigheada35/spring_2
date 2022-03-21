package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.mapper.NBoardAndMemberMapper;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.NBoardAndMemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NBoardServiceImpl implements NBoardService {

	// @Autowired
	// private NBoardMapper boardMapper;

	@Autowired
	private NBoardAndMemberMapper boardAndMemberMapper;// ssj

//ssj2
//	@Override
//	public List<NBoardVO> getList() {
//		log.info("getList()..");
//		return boardMapper.getList();
//	}
	@Override
	public List<NBoardAndMemberVO> getList() {// ssj2
		log.info("getList()..");
		return boardAndMemberMapper.getList();
	}

	@Override
	public NBoardAndMemberVO read(int board_id) { //
		log.info("read()..");
		hit(board_id);
		return boardAndMemberMapper.read(board_id);
	}

	@Override
	public void write(NBoardAndMemberVO board) { //
		log.info("write()..");
		boardAndMemberMapper.write(board);
		log.info("write2()..");
	}

	@Override
	public void modify(NBoardAndMemberVO board) { //
		log.info("modify()service...");
		boardAndMemberMapper.modify(board);
		log.info("modify()service2...");
	}

	@Override
	public void hit(int board_id) {
		log.info("hit()...");
		boardAndMemberMapper.hit(board_id); //
	}

	@Override
	public void delete(int board_id) {
		log.info("delete()...");
		boardAndMemberMapper.delete(board_id); //
	}

	@Override
	public int getTotal() {
		log.info("getTotal() ..");
		return boardAndMemberMapper.getTotalCount();//
	}

	@Override
	public List<NBoardAndMemberVO> getList(Criteria criteria) {
		log.info("getList() ..");
		// return boardMapper.getListWithPaging(criteria);
		return boardAndMemberMapper.getListWithPaging(criteria);// ssj3
	}

	@Override
	public List<BoardtypeVO> getboardtypeList() {
		// return boardMapper.getboardtypeList();
		return boardAndMemberMapper.getboardtypeList();// ssj
	}

}
