package com.example.outgoit.global_config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(
                csrf -> csrf.ignoringRequestMatchers(new AntPathRequestMatcher("/resources/static/**"))
                        .csrfTokenRepository(new HttpSessionCsrfTokenRepository())
        );

        http.authorizeHttpRequests(
                authorize -> authorize.anyRequest().permitAll()
        );

        http.formLogin(
                login -> login.disable()
        ).logout(
                logout -> logout.disable()
        );

        return http.build();
    }
}