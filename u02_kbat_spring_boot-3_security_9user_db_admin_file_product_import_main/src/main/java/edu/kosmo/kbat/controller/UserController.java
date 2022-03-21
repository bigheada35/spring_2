package edu.kosmo.kbat.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import edu.kosmo.kbat.service.ProductService;
import edu.kosmo.kbat.service.UserService;
import edu.kosmo.kbat.vo.ProductVO;
import edu.kosmo.kbat.vo.UserVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
public class UserController {
	
   //private UserService userService =  new UserService();
   @Autowired	
   private UserService userService;

 
	@GetMapping("/admin/adminHome")
	public void adminHome() {
		System.out.println("----adminHome");
	}  
	
	@GetMapping("/user/userHome")
	public void userHome() {
		System.out.println("----userHome");
	}
    
   @GetMapping("/add/addForm")
   public void addForm() {
      log.info("Welcome addForm");
      System.out.println("----- addForm ");
   }

   @PostMapping("/add/addUser")
   public String addUser(UserVO uservo) {
      log.info("post resister");
      System.out.println("----- addUser ");
      userService.addUser(uservo);

      return "redirect:/";
   }
   
   @GetMapping("/add/addFormAdmin")
   public void addFormAdmin() {
      log.info("Welcome addFormAdmin");
      System.out.println("----- addFormAdmin ");
   }
   @PostMapping("/add/addAdmin")
   public String addAdmin(UserVO uservo) {
      log.info("post resister");
      System.out.println("----- addAdmin ");
      userService.addAdmin(uservo);

      return "redirect:/";
   }
   
}
