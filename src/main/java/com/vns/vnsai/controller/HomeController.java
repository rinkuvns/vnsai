package com.vns.vnsai.controller;

import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.vns.vnsai.beans.SignUpBeans;
import com.vns.vnsai.cons.CommonCons;
import com.vns.vnsai.dao.impl.EmailMsg;

@Controller
public class HomeController {

	@GetMapping("/signup-with-google")
	public String home(Map<String, Object> model, @AuthenticationPrincipal OAuth2User principal) {
		
		if (principal != null) {
			String name = principal.getAttribute("name");
			String email = principal.getAttribute("email");
			model.put("name",name);
			model.put("email",email);
		}
		
		return "signup-with-google";
		
	}
	
	@GetMapping("/")
	public String displayIndexPage(Map<String, Object> model) {
		return "index";
	}
	
	@GetMapping("/Blog")
	public String Blog(Map<String, Object> model) {
		return "Blog";
	}
	
	@GetMapping("/feature")
	public String feature(Map<String, Object> model) {
		return "feature";
	}
	
	@GetMapping("/Usecase")
	public String Usecase(Map<String, Object> model) {
		return "Usecase";
	}
	
	@GetMapping("/integrations")
	public String integrations(Map<String, Object> model) {
		return "integrations";
	}
	
	@GetMapping("/loginPage")
	public String login(Map<String, Object> model) {
		return "login";
	}
	
	@GetMapping("/signup")
	public String signup(Map<String, Object> model) {
		return "signup";
	}
	
	@GetMapping("/pricing")
	public String pricing(Map<String, Object> model) {
		return "pricing";
	}
	
	@GetMapping("/templates")
	public String templates(Map<String, Object> model) {
		return "templates";
	}
	
	@GetMapping("/whatsapp-business-api")
	public String whatsappBusinessApi(Map<String, Object> model) {
		return "whatsapp-business-api";
	}
	
	@GetMapping("/whatsapp-template-message-library")
	public String whatsappTemplateMessageLibrary(Map<String, Object> model) {
		return "whatsapp-template-message-library";
	}
	
	
	@PostMapping("/RegisterUser")
	public String registerUser(@ModelAttribute("signup")SignUpBeans signUpBeans, Map<String, Object> model) {
		System.out.println("nnnnnnnnnnnnnnnnnnnn");
		String msg="Name: "+signUpBeans.getName()+"<br>"
				+ "Email: "+signUpBeans.getEmail()+"<br>"
				+ "Phone: "+signUpBeans.getPhone()+"<br>"
				+ "Password: "+signUpBeans.getPassword()+"";
		String toEmail=CommonCons.userFromEmail;
		String subject="New User";
		System.out.println(msg);
		EmailMsg emailMsg1=new EmailMsg(toEmail, subject, msg, msg);
		return "thankyoupage";
	}
	
}

