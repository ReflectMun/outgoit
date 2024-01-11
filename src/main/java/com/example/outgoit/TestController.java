package com.example.outgoit;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {
    @PostMapping
    public Integer test(){
        String salt = BCrypt.gensalt(10);
        System.out.println(salt);
        System.out.println(salt.length());

        String encrypted = BCrypt.hashpw("1234", salt);
        System.out.println(encrypted);
        System.out.println(encrypted.length());

        System.out.println(BCrypt.checkpw("1234", encrypted));
        System.out.println(BCrypt.checkpw("123", encrypted));
        return 1;
    }
}
