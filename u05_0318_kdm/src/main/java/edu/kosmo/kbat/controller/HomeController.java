package edu.kosmo.kbat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import edu.kosmo.kbat.principal.PrincipalDetails;
import lombok.extern.slf4j.Slf4j;

//@RestController
@Slf4j
@Controller
public class HomeController {

	// 회원 탈퇴 처리 다른 방법
	@GetMapping("/")
	public String home(@AuthenticationPrincipal PrincipalDetails principalDetails, HttpSession session) {
		// return "<h1>Hello World<h1>";

		/*
		 * if(principalDetails != null ) { log.info("/ =====principal ===== : " +
		 * principalDetails.getUser().getEnabled()); int enabled =
		 * principalDetails.getUser().getEnabled();
		 * 
		 * if (enabled == 0) {
		 * 
		 * session.invalidate(); SecurityContextHolder.clearContext();
		 * System.out.println("------회원탈퇴하셨습니다");
		 * 
		 * } }
		 */
		return "index";
	}

	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "loginForm";
	}

	@GetMapping("/loginForm2")
	public String loginform() {
		return "loginForm2";
	}

}
