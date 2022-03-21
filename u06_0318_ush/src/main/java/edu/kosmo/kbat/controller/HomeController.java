package edu.kosmo.kbat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

	//@RestController
	@Controller
	public class HomeController {
		
		@GetMapping("/")
		public String home() {
			//return "<h1>Hello World<h1>";
			return "index";
		}

		@GetMapping("/login")
		public String login() {
			return "loginForm";
		}

}
