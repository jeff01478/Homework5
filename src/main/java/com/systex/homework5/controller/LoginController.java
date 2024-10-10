package com.systex.homework5.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.systex.homework5.model.Person;
import com.systex.homework5.model.PersonRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	PersonRepository personRepository;
	
	@GetMapping("/")
	private String redirectToLogin(HttpSession session) {
        return "ajax-login";
    }
	
	@GetMapping("lottery/logout")
	private String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/lottery/loginConfirm")
	private String login(HttpSession session) {
		session.removeAttribute("successMessage");
		session.removeAttribute("userName");
		session.removeAttribute("password");
		session.removeAttribute("loginError");
		return "lottery/lottery";
	}
	
	@PostMapping("/lottery/ajax-login-confirm")
	@ResponseBody
	private String ajaxLogin(HttpSession session) {
		session.removeAttribute("successMessage");
		session.removeAttribute("userName");
		session.removeAttribute("password");
		session.removeAttribute("loginError");
		return "GOOD";
	}
	
	@GetMapping("/register")
	private ModelAndView register(HttpSession session) {
		session.removeAttribute("loginError");
		return new ModelAndView("register", "command", new Person());
	}
	
	@PostMapping("/addPerson")
	private String addPerson(@ModelAttribute Person person,
			HttpServletRequest request, HttpSession session) {
		return addPersonImp(person, request, session);
	}
	
	private String addPersonImp(Person person,
			HttpServletRequest request, HttpSession session) {
		String confirmPassword = request.getParameter("confirmPassword").toString();
		LinkedList<String> errorMsgs = new LinkedList<>();
		session.setAttribute("errors", errorMsgs);
		
		if (person == null) {
			errorMsgs.add("帳號或密碼不可空白!!");
			return "redirect:/register";
		}
		
		session.setAttribute("registerUserName", person.getUserName());
		session.setAttribute("registerPassword", person.getPassword());
		session.setAttribute("confirmPassword", confirmPassword);
		if (person.getUserName().isEmpty() || person.getPassword().isEmpty()) {
			errorMsgs.add("帳號或密碼不可空白!!");
		}
		
		if (!person.getPassword().equals(confirmPassword)) {
			errorMsgs.add("確認密碼有誤!!");
		}
		
		if (errorMsgs.size() != 0) {
			return "redirect:/register";
		}
		
		this.personRepository.save(person);
		session.setAttribute("successMessage", "註冊成功!!");
		session.removeAttribute("registerUserName");
		session.removeAttribute("registerPassword");
		session.removeAttribute("confirmPassword");
		return "ajax-login"; 
	}
}
