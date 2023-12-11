package com.example.outgoit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.example.outgoit.review")
public class OutgoitApplication {
    public static void main(String[] args) {
        SpringApplication.run(OutgoitApplication.class, args);
    }

}
