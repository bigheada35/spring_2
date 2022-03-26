package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.kosmo.kbat.mapper.QBoardAndMemberMapper;
import edu.kosmo.kbat.mapper.RBoardAndMemberMapper;
import edu.kosmo.kbat.mapper.ReviewMapper;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.MemberVO;
import edu.kosmo.kbat.vo.QBoardAndMemberVO;
import edu.kosmo.kbat.vo.RBoardAndMemberVO;
import edu.kosmo.kbat.vo.ReviewVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService{
		
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public void rdelete(int review_id) {
		reviewMapper.rdelete_rating(review_id);		
	}

	@Override
	public ReviewVO rvread(int review_id) {
		log.info("rv read()..");		
		return reviewMapper.rvread(review_id);
	}

}
