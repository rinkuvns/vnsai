package com.vns.vnsai.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.client.oidc.web.logout.OidcClientInitiatedLogoutSuccessHandler;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;

//@Configuration
//@EnableWebSecurity
public class WebSecurity  {
	/*
	
	@Autowired
	ClientRegistrationRepository clientRegistrationRepository;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		
		 * 
		 
		
		http.authorizeRequests()
		.antMatchers("/","/assets/**","/feature","/Usecase","/pricing","/templates",
				"/whatsapp-business-api","/whatsapp-template-message-library","/loginPage","/signup")
		.permitAll()
		.anyRequest().authenticated()
		.and().oauth2Login()
		.and()
		.logout()
		//.logoutSuccessUrl("/")
		.logoutSuccessHandler(oidcLogoutSuccessHandler())
		.invalidateHttpSession(true)
		.clearAuthentication(true)
		.deleteCookies("JSESSIONID");
		
	}
	
    private OidcClientInitiatedLogoutSuccessHandler oidcLogoutSuccessHandler() { 
        OidcClientInitiatedLogoutSuccessHandler successHandler =
        		new OidcClientInitiatedLogoutSuccessHandler(clientRegistrationRepository);
        successHandler.setPostLogoutRedirectUri("http://localhost:8080/");
        return successHandler;
    }
	
	*/
}
