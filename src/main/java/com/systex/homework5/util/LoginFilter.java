package com.systex.homework5.util;

import java.io.IOException;

import com.systex.homework5.model.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Slf4j
@RequiredArgsConstructor
public class LoginFilter implements Filter {

	final LoginService loginService;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		log.info("Filter is executed");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		HttpSession session = httpRequest.getSession();

		boolean isLogin = request.getParameter("isLogin") != null &&
				Boolean.parseBoolean(request.getParameter("isLogin"));

		if (isLogin) {
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			loginService.loginAuth(userName, password, session);
		}

		boolean loginAuth = session.getAttribute("loginAuth") != null
				&& (Boolean)session.getAttribute("loginAuth");

		if (loginAuth) {
			chain.doFilter(request, response);
			return;
		}

		log.info("使用者未登入");
		httpResponse.sendRedirect(httpRequest.getContextPath() + "/");
	}
}
