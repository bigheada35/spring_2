package edu.kosmo.kbat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kosmo.kbat.mapper.QBoardAndMemberMapper;
import edu.kosmo.kbat.page.Criteria;
import edu.kosmo.kbat.page.PageVO;
import edu.kosmo.kbat.service.NBoardService;
import edu.kosmo.kbat.service.QBoardService;
import edu.kosmo.kbat.service.RBoardService;
import edu.kosmo.kbat.service.ReviewService;
import edu.kosmo.kbat.service.StorageService;
import edu.kosmo.kbat.service.UserService;
import edu.kosmo.kbat.vo.NBoardAndMemberVO;
import edu.kosmo.kbat.vo.ProductVO;
import edu.kosmo.kbat.vo.QBoardAndMemberVO;
import edu.kosmo.kbat.vo.RBoardAndMemberVO;
import edu.kosmo.kbat.vo.ReviewVO;
import edu.kosmo.kbat.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class BoardController {
	
	@Autowired
	private NBoardService nboardService;
	
	@Autowired
	private QBoardService qboardService;//ssj
	
	@Autowired
	private RBoardService rboardService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StorageService storageService;
	
	@Autowired
	private ReviewService reviewService;
		
	@GetMapping("/nlist")//ssj3
	public String list(Criteria cri, Model model) {
		log.info("list()..");		
		model.addAttribute("list", nboardService.getList(cri));
		int total = nboardService.getTotal();
		log.info("total" + total);
		model.addAttribute("pageMaker", new PageVO(cri, total));		
		return "nboard/list";
	}
	
	@GetMapping("/ncontent_view") //
	public String content_view(NBoardAndMemberVO boardVO, Model model) {
		log.info("content_view()..");
		int board_id = boardVO.getBoard_id();
		model.addAttribute("content_view", nboardService.read(board_id));
		return "nboard/content_view";
	}
	
	@GetMapping("/nwrite_view")
	public String write_view(Model model) {		
		log.info("write_view()...");
		return "nboard/write_view";
		
	}
	
	@PostMapping("/nwrite")//
	public String write(NBoardAndMemberVO boardVO) {	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        
        System.out.println("?????? ????????? : " + user_id);
        
        boardVO.setMember_id(user_id);
        
        UserVO uservo = userService.getUser(user_id);
        
        boardVO.setMember_number(uservo.getMember_number());

        System.out.println("?????? ?????????1 : " +  uservo.getMember_number());
        System.out.println("?????? ?????????2 : " +  userService.getUser(user_id));
		log.info("write()...");	
		nboardService.write(boardVO);
		return "redirect:nlist";		
	}
	
	@PostMapping("/nmodify")//
	public String modify(NBoardAndMemberVO boardVO, Model model) {
		log.info("modify()...");
		nboardService.modify(boardVO);		
		return "redirect:nlist";		
	}	

	@GetMapping("/nmodify_view")//
	public String modify_view(NBoardAndMemberVO boardVO, Model model) {//ssj
		log.info("modify_view()...");
		int board_id = boardVO.getBoard_id();	
		model.addAttribute("modify_view", nboardService.read(board_id));
		return "nboard/modify_view";		
	}	
	
	@GetMapping("/ndelete")//
	public String delete(NBoardAndMemberVO boardVO, Model model) {		
		log.info("delete()...");	
		nboardService.delete(boardVO.getBoard_id());				
		return "redirect:nlist";		
	}
	
	@GetMapping("main/qlist")//ssj3
	public String qlist(Criteria cri, Model model, QBoardAndMemberVO boardVO) {
		log.info("qlist()..");				
		model.addAttribute("qlist", qboardService.qgetList(cri));
		System.out.println("member+id : " + qboardService.qgetList(cri));
		int total = qboardService.qgetTotalCount();
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageVO(cri, total));	
		
		System.out.println("????????? qboardService.qgetList(cri) : " +  qboardService.qgetList(cri));
		return "qboard/list";
	}
	
	@GetMapping("main/qcontent_view")
	public String qcontent_view(QBoardAndMemberVO boardVO, Model model) {
		log.info("qcontent_view()..");
		int board_id = boardVO.getBoard_id();
		model.addAttribute("qcontent_view", qboardService.qread(board_id));
		
		return "qboard/content_view";
	}
	
	@GetMapping("/qwrite_view")
	public String qwrite_view(QBoardAndMemberVO boardVO, Model model) {		
		log.info("qwrite_view()...");	
		int board_id = boardVO.getBoard_id();	
		
		model.addAttribute("qwirte_view", qboardService.qread(board_id));
		
		return "qboard/write_view";		
	}
	
	@PostMapping("/qwrite")
	public String qwrite(QBoardAndMemberVO boardVO, Model model) {		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        
        System.out.println("?????? ????????? : " + user_id);
        
        boardVO.setMember_id(user_id);
        
        UserVO uservo = userService.getUser(user_id);
        
        System.out.println("==================board_enable1 : " +  boardVO.getBoard_enable());
        
        boardVO.setMember_number(uservo.getMember_number());
        System.out.println(uservo.getMember_number());
        
        String board_enable = boardVO.getBoard_enable();
        
        model.addAttribute(board_enable);
        
        System.out.println(boardVO.getBoard_enable());        
        System.out.println("?????? ?????????1 : " +  uservo.getMember_number());
        System.out.println("?????? ?????????2 : " +  userService.getUser(user_id));
        
		log.info("qwrite0()...");	
		qboardService.qwrite(boardVO);
		log.info("qwrite1()...");	
		qboardService.qrepwrite(boardVO);
		log.info("qrepwrite()...");	
		
		return "redirect:qlist";		
	}
	
	@PostMapping("/qmodify")
	public String qmodify(QBoardAndMemberVO boardVO, Model model) {
		log.info("qmodify()...");
		qboardService.qmodify(boardVO);		
		return "redirect:qlist";		
	}	

	@GetMapping("/qmodify_view")
	public String qmodify_view(QBoardAndMemberVO boardVO, Model model) {//ssj
		log.info("qmodify_view()...");
		int board_id = boardVO.getBoard_id();	
		model.addAttribute("qmodify_view", qboardService.qread(board_id));
		return "qboard/modify_view";		
	}	
	
	@GetMapping("/qdelete")
	public String qdelete(QBoardAndMemberVO boardVO, Model model) {		
		log.info("delete()...");	
		qboardService.qdelete(boardVO.getBoard_id());				
		return "redirect:qlist";		
	}
	
	@GetMapping("/qreply_view")
	public String qreply_view(QBoardAndMemberVO boardVO, Model model) {		
		log.info("reply_view()...");
		System.out.println("---111--------group : " + boardVO.getReply_group());
		model.addAttribute("qreply_view", boardVO);
		System.out.println("---222--------group : " + boardVO.getReply_group());
		return "qboard/reply_view";		
	}
	
	@PostMapping("/qreply")
	public String qreply(QBoardAndMemberVO boardVO, Model model) {
		System.out.println("----------qreply-----");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        
        System.out.println("?????? ????????? : " + user_id);
        
        boardVO.setMember_id(user_id);
        
        UserVO uservo = userService.getUser(user_id);
        
        boardVO.setMember_number(uservo.getMember_number());

        System.out.println("?????? ?????????1 : " +  uservo.getMember_number());
        System.out.println("?????? ?????????2 : " +  userService.getUser(user_id));
		log.info("reply()...");
		System.out.println("---333--------group : " + boardVO.getReply_group());
		qboardService.qregisterReply(boardVO);	
	   
		System.out.println("---444--------group : " + boardVO.getReply_group());
		
				
		return "redirect:qlist";		
	}
	
	@GetMapping("main/rlist")//ssj3
	public String rlist(Criteria cri, Model model, RBoardAndMemberVO boardVO, ReviewVO rboardVO) {
		log.info("list()..");		
		model.addAttribute("rlist", rboardService.rgetList(cri));
		int total = rboardService.rgetTotalCount();
		log.info("total" + total);
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		System.out.println("---------------rboardVO.getReview_id() : " + rboardVO.getReview_id());
		
		return "rboard/list";
	}
	
	@GetMapping("main/rcontent_view")
	public String rcontent_view(RBoardAndMemberVO boardVO, ReviewVO rboardVO, Model model) {
		log.info("content_view()..");
		int board_id = boardVO.getBoard_id();
		int review_id = rboardVO.getReview_id();
		model.addAttribute("rcontent_view", rboardService.rread(board_id));

		return "rboard/content_view";
	}
	
	@GetMapping("main/rwrite_view")
	public String rwrite_view(Model model) {		
		log.info("write_view()...");
		return "rboard/write_view";
		
	}
	
	@PostMapping("main/rwrite")
	public String rwrite(RBoardAndMemberVO boardVO, ReviewVO rboardVO, Model model, @RequestPart(required = false) MultipartFile file,
			RedirectAttributes redirectAttributes) {		
		log.info("write()...");	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user_id = auth.getName();
        
        System.out.println("?????? ????????? : " + user_id);
        
        boardVO.setMember_id(user_id);
        
        UserVO uservo = userService.getUser(user_id);
        
        boardVO.setMember_number(uservo.getMember_number());
        
        String rating_check = boardVO.getRating_check();
        
        model.addAttribute(rating_check);
        
        int review_id = rboardVO.getReview_id();
        model.addAttribute(review_id);

        System.out.println("?????? ?????????1 : " +  uservo.getMember_number());
        System.out.println("?????? ?????????2 : " +  userService.getUser(user_id));
        System.out.println("?????? ?????????3 : " +  boardVO.getReview_id());
	

		System.out.println("?????? =================== : " + boardVO.getRating_check());

		storageService.store(file);		

		String uri1 = MvcUriComponentsBuilder.fromMethodName(
				FileUploadController.class,
				"serveFile", 
				file.getOriginalFilename())
		.build()
		.toUri()
		.toString();
		
		boardVO.setAttachment_name(uri1);
		
		rboardService.rwrite(boardVO);
		
		redirectAttributes.addFlashAttribute("message",
				"You successfully uploaded " + file.getOriginalFilename() + "!");
		
		
		return "redirect:rlist";		
	}
	
	
	@PostMapping("/rmodify")
	public String rmodify(RBoardAndMemberVO boardVO, Model model) {
		log.info("modify()...");
		rboardService.rmodify(boardVO);		
		return "redirect:rlist";		
	}	

	@GetMapping("/rmodify_view")
	public String rmodify_view(RBoardAndMemberVO boardVO, Model model) {//ssj
		log.info("modify_view()...");
		int board_id = boardVO.getBoard_id();	
		model.addAttribute("rmodify_view", rboardService.rread(board_id));
		return "rboard/modify_view";		
	}	
	
	@GetMapping("/rdelete")
	public String rdelete(RBoardAndMemberVO boardVO, ReviewVO rboardVO, Model model) {		
		log.info("delete()...");	
		int review_id = rboardVO.getReview_id();
		reviewService.rdelete(review_id);
		rboardService.rdelete(boardVO.getBoard_id());			
		return "redirect:rlist";		
	}

}
