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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import edu.kosmo.kbat.security.UserCustomDetailsService;

@Configuration		
@EnableWebSecurity 
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	
    @Autowired
    UserCustomDetailsService userCustomDetailsService;
    
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.httpBasic().and().authorizeRequests()
    	.antMatchers("/").permitAll()
    	.antMatchers("/add/**").permitAll()
    	.antMatchers("/upload/**").permitAll()
    	.antMatchers("/videos/**").permitAll()
    	.antMatchers("/pay/**").permitAll()
    	.antMatchers("/main/**").permitAll()
    	.antMatchers("/user/**").hasRole("USER")
    	.antMatchers("/admin/**").hasRole("ADMIN")
    	.anyRequest().authenticated()
    	.and().logout().permitAll()
    	.and().formLogin()
    	.and().csrf().disable();
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
		
        auth.userDetailsService(userCustomDetailsService)
        .passwordEncoder(passwordEncoder());
	}

    @Bean
    public PasswordEncoder passwordEncoder() {
    	System.out.println("-----------web security config , passwordEncoder");
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**");
    }
	
}
