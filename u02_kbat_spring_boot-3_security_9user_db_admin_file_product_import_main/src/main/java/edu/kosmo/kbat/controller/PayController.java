package edu.kosmo.kbat.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import edu.kosmo.kbat.service.ProductService;
import edu.kosmo.kbat.service.UserService;
import edu.kosmo.kbat.vo.ProductVO;
import edu.kosmo.kbat.vo.UserVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@CrossOrigin
//@Controller
@RestController
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private	ProductService productService;
   
	@GetMapping("/import")
	public ModelAndView import2(ModelAndView mav) {
		System.out.println("----import----");
		mav.setViewName("pay/import");
		return mav;
	}
	
	@PostMapping(value = "/getAccesToken")
	//@PostMapping("/getAccesToken")
	public String getAccesToken(ModelAndView mav){
		System.out.println("----getAccesToken----");
		//return "/pay/import"
		//return "redirect:/";
		return "";
	}
	

}
