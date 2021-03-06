package edu.kosmo.kbat.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.kbat.joinvo.ProductOrderDetailBoardVO;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.page.PageVO;
import edu.kosmo.kbat.principal.PrincipalDetails;
import edu.kosmo.kbat.service.MyPageService;
import edu.kosmo.kbat.service.UserService;
import edu.kosmo.kbat.vo.BoardtypeVO;
import edu.kosmo.kbat.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/myPage")

public class MyPageController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private MyPageService myPageService;

	@GetMapping("/myHome")
	public ModelAndView myHome_view(ModelAndView mav) {
		mav.setViewName("/myPage/myHome");
		return mav;
	}

	// 회원 정보 수정 페이지 이동

	@GetMapping("/updateMember")
	public ModelAndView updateMember_view(ModelAndView mav) {
		log.info("/myPage/updateMember");

		mav.setViewName("/myPage/updateMember");
		return mav;
	}

	// 회원정보수정 내역 업데이트

	@PostMapping("/updateMember/insert")
	public ModelAndView updateMemeber(ModelAndView mav, MemberVO memberVO) throws IllegalStateException, IOException {
		log.info("/myPage/updateMember" + memberVO);

		myPageService.updateMember(memberVO);

		mav.setViewName("redirect:/logout");
		return mav;
	}

	// 회원 탈퇴

	@GetMapping("/updateMember/delete")
	public String deleteMember(Authentication authentication) {
		String member_id = authentication.getName().toString();
		System.out.println("실행");
		myPageService.deleteMember(member_id);
		return "삭제완료";
	}

	// 회원 탈퇴 설정
	@RequestMapping("/")
	public String withdraw(MemberVO memberVO, HttpServletRequest request, HttpSession session) {
		System.out.println("------withdraw");
		System.out.println("탈퇴한 회원--------");

		/*
		 * if (session == 1 || !request.isRequestedSessionIdValid()) {
		 * System.out.println("세션이 무효화 상태입니다."); }
		 * 
		 * session.invalidate();
		 */
		return "/add/addUser";
	}

	// 주문 목록
	@GetMapping("/myOrderList")
	public ModelAndView myOrderList(@AuthenticationPrincipal PrincipalDetails principalDetails, Criteria cri,
			ModelAndView mav) throws Exception {
		log.debug("myOrderList");
		log.info("myOrderList");
		mav.setViewName("/myPage/myOrderList");

		// 인증 회원 정보
		MemberVO getMember = myPageService.readMember(principalDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("member", getMember);

		// 주문내역 리스트 가져오기
		/*
		 * mav.addObject("order_list",
		 * memberService.getOrderMyList(getMbr.getMbr_id()));
		 */
		mav.addObject("order_list", myPageService.getOrderMyList(getMember.getMember_id(), cri));

		int total = myPageService.getOrderMyTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}
	
	@GetMapping("/myReview")
	public ModelAndView reviewList(@AuthenticationPrincipal PrincipalDetails principalDetails, ProductOrderDetailBoardVO productOrderDetailBoardVO,
			ModelAndView mav, BoardtypeVO boardtypeVO) throws Exception {

		log.info("reviewList..");

		mav.setViewName("myPage/myReview");

		// 인증된 회원 정보 받아오기
		String member_id = principalDetails.getUserID();
		mav.addObject("member", userService.getUser(member_id));

		// 내가 쓴 리뷰 불러오기
		mav.addObject("reviewMyList", myPageService.getReviewMyList(member_id));
		
		log.debug("reviewList ========================"+ myPageService.getReviewMyList(member_id));
		
		 // 내가 쓴 리뷰 내용불러오기
		 //mav.addObject("reviewContent", myPageService.reviewContent(member_id));
		  
		 /* // 작성한 상품 리뷰 리스트 받아오기 mav.addObject("prdct_myr_list",
		 * myPageService.getMyReviewList(cri, member_id)); // 작성한 상품 리뷰 응답여부 받아오기
		 * mav.addObject("prdctr_cmnt_stat",
		 * myPageService.getPrdctrCmntStat(bCommentVO.getBoard_id())); // 답변한 댓글 불러오기
		 * mav.addObject("comment",
		 * myPageService.getMyqComment(boardtypeVO.getBoard_id()));
		 * 
		 * int total = myPageService.getReviewTotal(cri); log.info("total" + total);
		 * mav.addObject("pageMaker", new PrdReviewPageVO(cri, total));
		 */
		return mav;
	}

}
