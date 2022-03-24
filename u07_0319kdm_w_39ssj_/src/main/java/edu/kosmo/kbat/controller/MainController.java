package edu.kosmo.kbat.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import edu.kosmo.kbat.service.ProductCartService;
import edu.kosmo.kbat.service.ProductOrderService;
import edu.kosmo.kbat.service.ProductService;
import edu.kosmo.kbat.service.UserService;
import edu.kosmo.kbat.vo.ProductCartVO;
import edu.kosmo.kbat.vo.ProductOrderVO;
import edu.kosmo.kbat.vo.ProductVO;
import edu.kosmo.kbat.vo.UserVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
public class MainController {
	
	final int NameLimit = 15;
	final int DescLimit = 25;
	
	@Autowired
	private	ProductService productService;
	
	@Autowired
	private	ProductCartService productCartService;
	
	@Autowired
	private	ProductOrderService productOrderService;
	
	
	@Autowired
	private UserService userService;
	
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
		
		//상품 이름과 설명의 글짜 길이 줄이기
		String strName = productVO.getProduct_name();
		String strDesc = productVO.getProduct_description();
		if(strDesc != null) {
			if(strDesc.length() > DescLimit) {
				productVO.setProduct_description(strDesc.substring(0, DescLimit));
			}
		}
		if(strName != null) {
			if(strName.length() > NameLimit) {
				productVO.setProduct_name(strName.substring(0,NameLimit));
			}
		}
		
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
	public ModelAndView searchProductGET(Criteria cri, ModelAndView mav) {
		mav.setViewName("/main/search");

		mav.addObject("list", mainService.getProductList(cri));
		int total = mainService.getProductTotal(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		return mav;
	}
	@GetMapping("/main/cartorder")
	public String cartorder(HttpServletRequest request,  Model model) {
		String product_id = (String) request.getParameter("product_id");
		System.out.println("----cartorder----product_id:"+product_id);
		
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        System.out.println("----------------------유저 아이디 : " + user_id);	
        if(user_id != "anonymousUser") {
        	UserVO uservo = userService.getUser(user_id);
        	int member_number = uservo.getMember_number();
        	System.out.println("멤버 아이디1 : " +  member_number);
        	//System.out.println("멤버 아이디2 : " +  userService.getUser(user_id));
        	
      	//로그인 한사람의 장바구니에  물건을 담는다. 
        	//  조건: view에서 product_id가 확실하게 넘어왔고,
        	//       DB에 동일한 상품이 없는 경우만  물건을 담는다.
        	if(product_id !=null ) {
        		System.out.println("==============1");
        		if(productCartService.exist(member_number, Integer.valueOf(product_id)) == null) { 
        				System.out.println("==============2");
        				productCartService.write(member_number, Integer.valueOf(product_id));
        		}
        	}
        		
        	
        	// 로그인 한사람의 장바구니안 리스트를 읽어온다.
            List <ProductCartVO> productCartVO = productCartService.getList(member_number);
    		model.addAttribute("products", productCartVO);
        }
 		return "/user/cartOrder";
	}
	@GetMapping("/main/cartorder_delete")
	public String cartorder_delete(HttpServletRequest request,  Model model) {
		String product_id = (String) request.getParameter("product_id");
		System.out.println("----cartorder_delete----product_id:"+product_id);
		
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        System.out.println("----------------------유저 아이디 : " + user_id);	
        if(user_id != "anonymousUser" && product_id !=null) {
        	UserVO uservo = userService.getUser(user_id);
        	int member_number = uservo.getMember_number();
        	System.out.println("멤버 아이디1 : " +  member_number);
        	//System.out.println("멤버 아이디2 : " +  userService.getUser(user_id));
        	
        	//로그인 한사람의 장바구에서 물건 한개를 삭제한다.
        	if(product_id !=null)
        		productCartService.delete(member_number, Integer.valueOf(product_id));
        	
        	// 로그인 한사람의 장바구니안 리스트를 읽어온다.
            List <ProductCartVO> productCartVO = productCartService.getList(member_number);
    		model.addAttribute("products", productCartVO);
        }
 		return "/user/cartOrder";
	}
	@GetMapping("/main/checkout")
	public String checkout(HttpServletRequest request,  Model model) {
		String product_id = (String) request.getParameter("product_id");
		System.out.println("----checkout----product_id:"+product_id);

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        System.out.println("----------------------유저 아이디 : " + user_id);	
        if(user_id != "anonymousUser") {
        	UserVO uservo = userService.getUser(user_id);
        	int member_number = uservo.getMember_number();
        	System.out.println("멤버 아이디1 : " +  member_number);
        	//System.out.println("멤버 아이디2 : " +  userService.getUser(user_id));
        	
          	//로그인 한사람의 장바구니에  물건을 담는다. 
        	//  조건: view에서 product_id가 확실하게 넘어왔고,
        	//       DB에 동일한 상품이 없는 경우만  물건을 담는다.
        	if(product_id !=null ) {
        		System.out.println("==============1");
        		if(productCartService.exist(member_number, Integer.valueOf(product_id)) == null) { 
        				System.out.println("==============2");
        				productCartService.write(member_number, Integer.valueOf(product_id));
        		}
        	}
        	
        	// 로그인 한사람의 장바구니만 리스트를 읽어온다.
            List <ProductCartVO> productCartVO = productCartService.getList(member_number);
    		model.addAttribute("products", productCartVO);
    		
    		// 로그인 한사람의 주문 리스트를 읽어온다.
    		List <ProductOrderVO> productOrderVO = productOrderService.getOrderList(uservo.getMember_id());
    		model.addAttribute("products_order", productOrderVO);
        }

		
		return "/pay/checkout";
	}
	@GetMapping("/main/checkout_delete")
	public String checkout_delete(HttpServletRequest request,  Model model) {
		String orders_id = (String) request.getParameter("orders_id");
		System.out.println("----cartorder_delete----orders_id:"+orders_id);
		String product_id = (String) request.getParameter("product_id");
		System.out.println("----cartorder_delete----product_id:"+product_id);		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        System.out.println("----------------------유저 아이디 : " + user_id);	
        if(user_id != "anonymousUser" ) {
        	UserVO uservo = userService.getUser(user_id);
        	int member_number = uservo.getMember_number();
        	System.out.println("멤버 아이디1 : " +  member_number);
        	//System.out.println("멤버 아이디2 : " +  userService.getUser(user_id));

        	
        	//로그인 한사람의 주문 리스트에서 물건 한개를 삭제한다.
        	if(product_id !=null) {
        		 System.out.println("------------------a1------------------------------------------------ " );	
        		 productCartService.delete(member_number, Integer.valueOf(product_id));
        		 System.out.println("------------------a2----------------------------------------------- " );	
        	}
        	
        	// 로그인 한사람의 장바구니안 리스트를 읽어온다.
            List <ProductCartVO> productCartVO = productCartService.getList(member_number);
    		model.addAttribute("products", productCartVO);
    		
    		
    		
        	//로그인 한사람의 주문 리스트에서 물건 한개를 삭제한다.
        	if(orders_id !=null) {
        		 System.out.println("------------------b1------------------------------------------------ " );	
        		productOrderService.delete(Integer.valueOf(orders_id));
        		 System.out.println("------------------b2----------------------------------------------- " );	
        	}
    		
    		// 로그인 한사람의 주문 리스트를 읽어온다.
    		List <ProductOrderVO> productOrderVO = productOrderService.getOrderList(uservo.getMember_id());
    		model.addAttribute("products_order", productOrderVO);    		
        }
 		return "/pay/checkout";
	}	
	@GetMapping("/pay/checkout_import")
	public String checkout_import(HttpServletRequest request,  Model model) {
		System.out.println("----import----");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        System.out.println("----------------------유저 아이디 : " + user_id);	
        if(user_id != "anonymousUser") {
        	UserVO uservo = userService.getUser(user_id);
        	int member_number = uservo.getMember_number();
        	System.out.println("멤버 아이디1 : " +  member_number);
        	//System.out.println("멤버 아이디2 : " +  userService.getUser(user_id));
        	
        	/////////////////////
        	//   CART -> ORDER
        	/////////////////////
        	
      	  	// 로그인 한사람의 장바구니안 리스트들을 읽어온다.
            List <ProductCartVO> productCartVO = productCartService.getList(member_number);
            for (ProductCartVO cart : productCartVO) {
				// 장바구니 에서  주문 리스로  물건 복사한다.
            	System.out.println("============== cart 2 order ============");
            	// write(int product_price, int member_number, int product_id);
            	productOrderService.write( cart.getProduct_price(),  cart.getMember_number(),  cart.getProduct_id());
            	
            	// 장바구니 안의 물건은 삭제 한다.
            	productCartService.delete(member_number, cart.getProduct_id());
			}
    		//model.addAttribute("products", productCartVO);
    		
    		// 로그인 한사람의 주문 리스트를 읽어온다.
    		List <ProductOrderVO> productOrderVO = productOrderService.getOrderList(uservo.getMember_id());
    		model.addAttribute("products_order", productOrderVO);    		
        }

		return "/pay/import";
	}
	@GetMapping("/main/checkout_import_delete")
	public String checkout_import_delete(HttpServletRequest request,  Model model) {
		String order_id = (String) request.getParameter("order_id");
		System.out.println("----checkout_----order_id:" + order_id);
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        System.out.println("----------------------유저 아이디 : " + user_id);	
        if(user_id != "anonymousUser" && order_id !=null) {
        	UserVO uservo = userService.getUser(user_id);
        	int member_number = uservo.getMember_number();
        	System.out.println("멤버 아이디1 : " +  member_number);
        	//System.out.println("멤버 아이디2 : " +  userService.getUser(user_id));
        	
        	//로그인 한사람의 주문 리스트에서 물건 한개를 삭제한다.
        	if(order_id !=null)
        		productOrderService.delete(Integer.valueOf(order_id));
        	
        	// 로그인 한사람의 장바구니안 리스트를 읽어온다.
            List <ProductCartVO> productCartVO = productCartService.getList(member_number);
    		model.addAttribute("products", productCartVO);
    		
    		// 로그인 한사람의 주문 리스트를 읽어온다.
    		List <ProductOrderVO> productOrderVO = productOrderService.getOrderList(uservo.getMember_id());
    		model.addAttribute("products_order", productOrderVO);    		
        }
 		return "/pay/import";
	}
	
	
}
