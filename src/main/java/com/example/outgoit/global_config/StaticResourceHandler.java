package com.example.outgoit.global_config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class StaticResourceHandler implements WebMvcConfigurer {
    // 정적파일 핸들링을 위한 Config 클래스 및 메서드
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/static/**")
                .addResourceLocations("classpath:/static/");
    }
}
