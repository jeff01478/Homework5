package com.systex.homework5.util;

import com.systex.homework5.model.LoginService;
import com.systex.homework5.model.PersonRepository;
import jakarta.servlet.Filter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration(proxyBeanMethods = false)
public class FilterConfig {

    @Bean
    public FilterRegistrationBean<Filter> loggingFilter(LoginService loginService){
        FilterRegistrationBean<Filter> registrationBean
          = new FilterRegistrationBean<>();

        registrationBean.setFilter(new LoginFilter(loginService));
        registrationBean.addUrlPatterns("/lottery/*");
        registrationBean.setOrder(1);

        return registrationBean;
    }
  
}
