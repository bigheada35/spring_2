package edu.kosmo.kbat.service;

import java.util.List;

import edu.kosmo.kbat.joinvo.ProductOrderDetailBoardVO;
import edu.kosmo.kbat.joinvo.ProductOrderDetailOrderVO;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.vo.MemberVO;

public interface MyPageService {
	// 회원 정보 조회
	MemberVO readMember(String member_id);

	// 회원 정보 수정 (비번포함x)
	public void updateMember(MemberVO memberVO);

	// 회원 탈퇴
	public void deleteMember(String member_id);

	// 회원 탈퇴 설정
	public void withdraw(MemberVO memberVO);

	// 주문내역 리스트 가져오기
	public List<ProductOrderDetailOrderVO> getOrderMyList(String member_id);

	public List<ProductOrderDetailOrderVO> getOrderMyList(String member_id, Criteria cri);

	// 페이징 단위에 적용되는 최대 주문내역 단위
	public int getOrderMyTotal(Criteria cri);
	
	// 내가 작성한 상품 리뷰
	public List<ProductOrderDetailBoardVO> getReviewMyList(String member_id);

	public List<ProductOrderDetailBoardVO> getMyReviewList(Criteria cri, String member_id);


}
