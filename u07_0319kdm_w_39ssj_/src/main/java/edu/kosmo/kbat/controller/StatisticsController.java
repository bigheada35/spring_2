package edu.kosmo.kbat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.kbat.joinvo.ProductOrderDetailOrderVO;
import edu.kosmo.kbat.principal.PrincipalDetails;
import edu.kosmo.kbat.service.MyPageService;
import edu.kosmo.kbat.service.StatisticsService;
import edu.kosmo.kbat.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

//
@Slf4j
@RestController
@RequestMapping("/statistics")
public class StatisticsController {

	@Autowired
	private StatisticsService statisticService;
	
	@Autowired
	private MyPageService myPageService;

	@GetMapping("/income")
	public ModelAndView adminDonationStat(@AuthenticationPrincipal PrincipalDetails principalDetails, ModelAndView mav, MemberVO member, ProductOrderDetailOrderVO povo)
			throws Exception {
		mav.setViewName("/statistics/income");

		// 인증 회원 정보
		MemberVO getMember = myPageService.readMember(principalDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("member", getMember);


		mav.addObject("day", statisticService.dailyChart());
		mav.addObject("week", statisticService.weekChart());
		
		log.info("=========================" + statisticService.monthChart());
		mav.addObject("month", statisticService.monthChart());
		
		mav.addObject("year", statisticService.yearChart());

		return mav;
	}

}
