package com.systex.homework5.controller;

import java.util.HashMap;
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
	
	@GetMapping("/login")
	private String login() {
		return "login";
	}
	
	@GetMapping("/ajax-login")
	private String ajxaLogin() {
		return "ajax-login";
	}
	
	@GetMapping("/lottery/logout")
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
	
	@PostMapping("/register-confirm")
	@ResponseBody
	private Map<String, String> registerConfirm(HttpServletRequest request, HttpSession session) {
		return registerConfirmImp(request, session);
	}
	
	@PostMapping("/add-person")
	private String addPerson(@ModelAttribute Person person, 
			HttpServletRequest request, HttpSession session) {
		return addPersonImp(person, request, session);
	}
	
	private Map<String, String> registerConfirmImp(HttpServletRequest request, HttpSession session) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		HashMap<String, String> msgs = new HashMap<>();
		boolean userNameConfirm = false;
		boolean passwordConfirm = false;
		
		if (userName.length() < 6 || userName.length() > 12) {
			System.out.println("帳號不合法");
			msgs.put("userNameMsg", "帳號長度必須為6~12字元");
			msgs.put("userNameColor", "Red");
			userNameConfirm = false;
		} else if(isExistUserName(userName)) {
			System.out.println("帳號名稱已存在");
			msgs.put("userNameMsg", "帳號名稱已存在");
			msgs.put("userNameColor", "Red");
			userNameConfirm = false;
		} else {
			System.out.println("此帳號可使用");
			msgs.put("userNameMsg", "此帳號可使用");
			msgs.put("userNameColor", "LimeGreen");
			userNameConfirm = true;
		}
		
		if (password.length() < 6 || password.length() > 12) {
			msgs.put("passwordMsg", "密碼長度必須為6~12字元");
			msgs.put("passwordColor", "Red");
			passwordConfirm = false;
		} else {
			msgs.put("passwordMsg", "此密碼可使用");
			msgs.put("passwordColor", "LimeGreen");
			passwordConfirm = true;
		}
		
		if (userNameConfirm && passwordConfirm) {
			session.setAttribute("registerConfirm", true);
		} else {
			session.setAttribute("registerConfirm", false);
		}
		System.out.println(msgs);
		return msgs;
	}
	
	private boolean isExistUserName(String userName) {
		Person user = personRepository.findByUserName(userName);
		return user != null;
	}
	
	private String addPersonImp(Person person,
			HttpServletRequest request, HttpSession session) {
		String confirmPassword = request.getParameter("confirmPassword").toString();
		LinkedList<String> errorMsgs = new LinkedList<>();
		boolean registerConfirm = session.getAttribute("registerConfirm") != null
				? (Boolean)session.getAttribute("registerConfirm") : false;
		session.setAttribute("errors", errorMsgs);
		
		if (person == null) {
			errorMsgs.add("帳號或密碼不可空白!!");
			return "redirect:/register";
		}
		
		session.setAttribute("registerUserName", person.getUserName());
		session.setAttribute("registerPassword", person.getPassword());
		session.setAttribute("confirmPassword", confirmPassword);
		
		if (!registerConfirm) {
			errorMsgs.add("帳號或密碼規則錯誤!!");
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
		session.removeAttribute("registerConfirm");
		return "ajax-login"; 
	}
}
