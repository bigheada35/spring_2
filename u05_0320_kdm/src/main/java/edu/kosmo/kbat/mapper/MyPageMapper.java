package edu.kosmo.kbat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.kbat.joinvo.ProductOrderDetailOrderVO;
import edu.kosmo.kbat.page.MemberOrderCriteria;
import edu.kosmo.kbat.vo.MemberVO;

@Mapper
public interface MyPageMapper {
	// 회원 정보 조회
	MemberVO readMember(String member_id);

	// 회원 정보 수정 (비번포함x)
	public void updateMember(MemberVO memberVO);

	// 회원 탈퇴
	public void deleteMember(String member_id);

	// 회원 탈퇴 설정
	void withdraw(MemberVO memberVO);

	// 주문내역 리스트 가져오기
	public List<ProductOrderDetailOrderVO> getOrderMyList(String member_id);

	public List<ProductOrderDetailOrderVO> getOrderMyListPaging(String member_id, MemberOrderCriteria cri);

	// 페이징 단위에 적용되는 최대 주문내역 단위
	public int getOrderMyTotalCount(MemberOrderCriteria cri);

}
