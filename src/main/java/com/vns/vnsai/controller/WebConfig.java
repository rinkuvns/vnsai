package com.vns.vnsai.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@Controller
public class WebConfig implements WebMvcConfigurer{
	
	
	public void configureViewResolvers(ViewResolverRegistry registry) {
    	InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/view/");
        resolver.setSuffix(".jsp");
        resolver.setViewClass(JstlView.class);
        registry.viewResolver(resolver);
    }
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	 /////////////Start Sources//////////////////////
	    registry.addResourceHandler("/assets/**")
	            .addResourceLocations("/view/assets/");
	 /////////////End Sources//////////////////////
	    
	    
 }
}
