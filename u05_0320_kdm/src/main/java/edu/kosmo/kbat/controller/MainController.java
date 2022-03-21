package edu.kosmo.kbat.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.page.PageVO;
import edu.kosmo.kbat.service.MainService;
import edu.kosmo.kbat.service.ProductService;
import edu.kosmo.kbat.service.UserService;
import edu.kosmo.kbat.vo.ProductVO;
import edu.kosmo.kbat.vo.UserVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller

public class MainController {
	
	@Autowired
	private	ProductService productService;
	
	//KDM 검색
	@Autowired
	private MainService mainService;
	
	
	@GetMapping("/pay/import")
	public void import2() {
		System.out.println("----import----");
		//return "/pay/import"
	}
	@GetMapping("/main/main")
	public void main(Model model) {
		System.out.println("----main----");
		List <ProductVO> productVO = productService.getList();

		final int NameLimit = 15;
		final int DescLimit = 25;
		for (ProductVO productVO2 : productVO) {
			String strName = productVO2.getProduct_name();
			String strDesc = productVO2.getProduct_description();
			if(strDesc != null) {
				if(strDesc.length() > DescLimit) {
					//System.out.print("--"+ strDesc.substring(0, 25));
					//System.out.println("--length:"+ strDesc.length());
					productVO2.setProduct_description(strDesc.substring(0, DescLimit));
				}
			}
			if(strName != null) {
				if(strName.length() > NameLimit) {
					productVO2.setProduct_name(strName.substring(0,NameLimit));
				}
			}
			
		}
		
		model.addAttribute("products", productVO);
	}
	@GetMapping("/main/detail")
	public void detail(HttpServletRequest request,  Model model) {
		String product_id = (String) request.getParameter("product_id");
		System.out.println("----detail----product_id:"+product_id);
		ProductVO productVO = productService.get(Integer.valueOf(product_id));
		model.addAttribute("prod", productVO);
	}
	@GetMapping("/main/playVideo")
	public String playVideo(HttpServletRequest request,  Model model) {
		String product_id = (String) request.getParameter("product_id");
		System.out.println("----playVideo----product_id:"+product_id);
		ProductVO productVO = productService.get(Integer.valueOf(product_id));
		model.addAttribute("prod", productVO);
		
		return "/user/playVideo";
	}
	
	
	// KDM 상품 검색 
	@GetMapping("/main/search")
	public String searchProductGET(Criteria cri, Model model) {
		
		log.info("cri : " + cri);
		
		List<ProductVO> list = mainService.getProductList(cri);
		log.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "/main/search";
		}
		
		model.addAttribute("pageMaker", new PageVO(cri, mainService.getProductTotal(cri)));
		
		
		return "/main/search";
		
	}
	
}
