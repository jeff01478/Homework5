package com.systex.homework5.util;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean<LoginFilter> loggingFilter(LoginFilter loginFilter){
        FilterRegistrationBean<LoginFilter> registrationBean 
          = new FilterRegistrationBean<>();
          
        registrationBean.setFilter(loginFilter);
        registrationBean.addUrlPatterns("/lottery/*");
        registrationBean.setOrder(1);

        return registrationBean;    
    }
}
