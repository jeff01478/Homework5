package com.systex.homework5.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.systex.homework5.model.PersonRepository;
import jakarta.servlet.http.HttpSession;

@Slf4j
@Controller
public class LoginController {

	@RestController
	class LoginRestController {
		@PostMapping("/lottery/ajax-login-confirm")
		String ajaxLogin(HttpSession session) {
			return ajaxLoginImp(session);
		}
	}

	final PersonRepository personRepository;

	LoginController(PersonRepository personRepository) {
		this.personRepository = personRepository;
	}
	
	@GetMapping("/")
	String redirectToLogin() {
        return "ajax-login";
    }
	
	@GetMapping("/login")
	String login() {
		return "login";
	}
	
	@GetMapping("/ajax-login")
	String ajaxLogin() {
		return "ajax-login";
	}
	
	@GetMapping("/lottery/logout")
	String logout(HttpSession session) {
		return logoutImp(session);
	}
	
	@PostMapping("/lottery/loginConfirm")
	String login(HttpSession session) {
		return loginImp(session);
	}

	private String logoutImp(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	private String loginImp(HttpSession session) {
		session.removeAttribute("successMessage");
		session.removeAttribute("userName");
		session.removeAttribute("password");
		session.removeAttribute("loginError");
		return "lottery/lottery-from";
	}

	String ajaxLoginImp(HttpSession session) {
		session.removeAttribute("successMessage");
		session.removeAttribute("userName");
		session.removeAttribute("password");
		session.removeAttribute("loginError");
		return "GOOD";
	}
}
