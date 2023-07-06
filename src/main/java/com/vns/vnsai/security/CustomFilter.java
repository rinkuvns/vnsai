package com.vns.vnsai.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class CustomFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        if ("GET".equals(request.getMethod())) {
        	System.out.println("==========GET=========="+request);
        	StringBuffer requestURL = request.getRequestURL();
        	System.out.println(requestURL.toString());
        	String str=requestURL.toString();
        	int index=str.indexOf("AA");
        	if(index>-1) {
        		//response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        	}else {
        		
        	
        	
        	System.out.println(requestURL.toString());
            filterChain.doFilter(request, response);
        	}
        } else {
        	System.out.println("==========POST==========");
           // response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        	filterChain.doFilter(request, response);
        }
    }
}
