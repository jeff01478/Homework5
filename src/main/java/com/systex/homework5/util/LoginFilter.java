package com.systex.homework5.util;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.systex.homework5.model.Person;
import com.systex.homework5.model.PersonRepository;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginFilter implements Filter {
	
	@Autowired
	PersonRepository personRepository;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter is executed");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpSession session = httpRequest.getSession();
		
		boolean isLogin = request.getParameter("isLogin") != null 
				? Boolean.parseBoolean(request.getParameter("isLogin")) : false;
		
		if (isLogin) {
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			loginAuth(userName, password, session);
		}
		
		boolean loginAuth = session.getAttribute("loginAuth") != null 
				? (Boolean)session.getAttribute("loginAuth") : false;
		
		if (loginAuth) {
			chain.doFilter(request, response);
			return;
		}
		
		System.out.println("使用者未登入");
		httpResponse.sendRedirect(httpRequest.getContextPath() + "/");
	}
	
	private void loginAuth(String userName, String password, HttpSession session) {
		Person person = personRepository.findByUserName(userName);
		if (person != null) {
			if (person.getPassword().equals(password)) {
				session.setAttribute("loginAuth", true);
				System.out.println("登入成功");
				return;
			}
		}
		session.setAttribute("userName", userName);
		session.setAttribute("password", password);
		session.setAttribute("loginError", "帳號或密碼有誤!!");
		session.setAttribute("loginAuth", false);
	}
}
