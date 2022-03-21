package edu.kosmo.kbat.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import edu.kosmo.kbat.principal.PrincipalOauth2UserService;
import edu.kosmo.kbat.principal.UserCustomDetailsService;

@Configuration		
@EnableWebSecurity 
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserCustomDetailsService customDetailsService;
	    
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
    //@Autowired //추가
    //private CustomOAuth2UserService customOAuth2UserService;
    
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.csrf().disable();
    	http.httpBasic().and().authorizeRequests()
    	.antMatchers("/").permitAll()
    	.antMatchers("/login/**").permitAll() //추가
    	.antMatchers("/oauth2/**").permitAll()
    	.antMatchers("/add/**").permitAll() 	
    	.antMatchers("/upload/**").permitAll()
    	.antMatchers("/videos/**").permitAll()
    	.antMatchers("/pay/**").permitAll()
    	.antMatchers("/main/**").permitAll()
    	.antMatchers("/user/**").hasRole("USER")
    	.antMatchers("/admin/**").hasRole("ADMIN")
    	.antMatchers("/**").permitAll()    	
    	//.antMatchers("/kakao").hasAuthority(KAKAO.getRoleType())
    	.anyRequest().permitAll() //.anyRequest().authenticated() 에서 변경 .permitAll()
    	//.and().logout().logoutUrl("/logout").logoutSuccessUrl("/")
    	.and().logout().permitAll().logoutSuccessUrl("/")
    	.and().formLogin().loginPage("/loginForm")//.loginPage() 추가
    	.loginProcessingUrl("/login").defaultSuccessUrl("/index") //추가
    	.and().oauth2Login().loginPage("/loginForm")//추가
    	.userInfoEndpoint().userService(principalOauth2UserService); //추가
    	
    }
    
    //이렇게 사용시 create bean에러 났었음
	//@Autowired
	//public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
    
    @Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception{		
		auth.inMemoryAuthentication()
			.withUser("kbatadmin").password(passwordEncoder().encode("1234")).roles("ADMIN");
		auth.inMemoryAuthentication()
			.withUser("kbatuser").password(passwordEncoder().encode("1234")).roles("USER");
		
        auth.userDetailsService(customDetailsService)
        .passwordEncoder(passwordEncoder());
	}

    
    @Bean
    public BCryptPasswordEncoder passwordEncoder() { //PasswordEncoder -> BCryptPasswordEncoder로 바꿈
    	System.out.println("-----------web security config , passwordEncoder");
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**");
    }
    
}

