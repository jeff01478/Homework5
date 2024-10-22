package com.systex.homework5.util;

import java.io.IOException;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

@Slf4j
@Component
public class EncodingFilters implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		log.info("編碼已設定");
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
		response.setCharacterEncoding("UTF-8");
	}
}
