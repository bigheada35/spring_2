package edu.kosmo.kbat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kosmo.kbat.joinvo.ProductOrderDetailBoardVO;
import edu.kosmo.kbat.joinvo.ProductOrderDetailOrderVO;
import edu.kosmo.kbat.mapper.MyPageMapper;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private MyPageMapper myPageMapper;

	// 회원 정보 조회

	public MemberVO readMember(String member_id) {

		log.info("get() ..");

		return myPageMapper.readMember(member_id);
	}

	// 회원 정보 수정

	public void updateMember(MemberVO memberVO) {
		log.info("updateMember()");

		System.out.println(!memberVO.getPassword().equals(""));

		if (!memberVO.getPassword().equals("")) {

			String password = memberVO.getPassword();
			String encodedPassword = passwordEncoder.encode(password);
			memberVO.setPassword(encodedPassword);
			myPageMapper.updateMember(memberVO);
		} else {
			myPageMapper.updateMember(memberVO);
		}

	}

	// 회원 탈퇴
	public void deleteMember(String member_id) {
		log.info("deleteMember()");
		myPageMapper.deleteMember(member_id);
	}

	// 회원 탈퇴 설정
	@Override
	public void withdraw(MemberVO memberVO) {

		log.info("withdraw()...");

		myPageMapper.withdraw(memberVO);
	}

	// 주문내역 리스트
	@Override
	public List<ProductOrderDetailOrderVO> getOrderMyList(String member_id) {
		log.info("getOrderMyList()......");
		return myPageMapper.getOrderMyList(member_id);
	}

	// 주문내역 리스트 페이징
	@Override
	public List<ProductOrderDetailOrderVO> getOrderMyList(String member_id, Criteria cri) {
		log.info("getOrderMyList WITH criteria: " + cri);
		return myPageMapper.getOrderMyListPaging(member_id, cri);
	}

	// 주문내역 리스트 페이징 갯수
	@Override
	public int getOrderMyTotal(Criteria cri) {
		log.info("getOrderMyTotal WITH criteria: " + cri);
		return myPageMapper.getOrderMyTotalCount(cri);
	}

	// 내가 작성한 상품 리뷰
	
	@Override
	public List<ProductOrderDetailBoardVO> getReviewMyList(String member_id) {
		log.info("getReviewMyList()......");
		return myPageMapper.reviewMyList(member_id);
	}
	
	@Override
	public List<ProductOrderDetailBoardVO> getMyReviewList(Criteria cri, String member_id) {
		log.info("reviewMyList()......");
		return myPageMapper.getMyReviewList(cri, member_id);
	}
	
	

	

}
